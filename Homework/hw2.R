# Probability Simulations

n = 10000

set.seed(123)

# 11) Coin-Toss Simulation

Flips = function() {
  # 0 is tails, 1 is heads
  flips = sample(0:1, 20, replace = TRUE)
  s = sum(flips == 1)
  return(s)
}

results = replicate(n, Flips())
tab = table(results)

# a) Histogram
hist(results, breaks=seq(-0.5, 20.5, by=1), main="Number of Heads in 20 Tosses (10,000 Experiments)", xlab="Number of Heads")

# b) Probability of getting exactly 10 heads
p_10heads = (tab["10"]/n)*100
cat("Probability of getting exactly 10 heads with 20 flips:", p_10heads,"%")

# c) Probability of getting at least 15 heads
i = 15
x = 0

while (i <= 20) {
  x = x + sum(results == i)
  i = i + 1
}

p_15_heads_or_more = (x/n)*100
cat("Probability of getting 15 heads or more with 20 flips:", p_15_heads_or_more,"%")

# d) Compare with theoretical probabilities

p_10heads_theoretical = (factorial(20)/(factorial(10)^2))/(2^20)
cat("Theoretical probability of getting exactly 10 heads on 20 flips: ",p_10heads_theoretical*100,"%")
cat("Simulated probability of getting exactly 10 heads on 20 flips: ",p_10heads,"%")

i = 15
x = 0

while (i <= 20) {
  x = x + factorial(20)/(factorial(20-i)*factorial(i))
  i = i + 1
}

p_15_heads_or_more_t = (x/(2^20))*100
cat("Theoretical probability of getting 15 heads or more on 20 flips: ",p_15_heads_or_more_t,"%")
cat("Simulated probability of getting 15 heads or more on 20 flips: ",p_15_heads_or_more,"%")


# 12) Birthday Simulation 

bdays = list()

Bdays = function(p) {
  # 1-365, each number corresponds to a day of the year
  bdays = append(bdays, sample(1:365, p, replace = TRUE))
  return(sum(duplicated(bdays)))
}

# a) Run 10,000 Simulations
results = replicate(n, Bdays(30))

# b) How many trials had at least 2 people share a birthday 
tab = table(results)
tab
sum(tab)

# c) Estimation of probability 
p_1bday_shared = (n - tab[1]) / n
cat("Estimated probability that a group of 30 people contains at least 2 people that share a birthday:", p_1bday_shared*100,"%")

# d) Loop for groups of 2-70 people and plot 

i = 2
rs = c()

while (i <= 70) {
  sim = replicate(n, Bdays(i))
  # Success = at least one duplicate birthday, so estimate P(success) = successes / n
  rs = append(rs, sum(sim > 0)/n)
  i = i + 1
}

x_shift = 2:70
plot(x_shift, rs, type="l", col="blue", main="Probability of a Shared Birthday", xlab="Size of Group", ylab="P(at least 2 share a birthday)")
abline(h=0.5, col="red")
abline(v=23, col="blue")


# 13) Poker Hand Simulation
n = 1000000

# Suit ranges: Hearts (1:13), Diamonds (14:26), Clubs (27:39), Spades (40:52)
PickCards = function(min, max, target) {
  cards = sample(1:52, 5, replace = FALSE)
  
  flat_values = unlist(cards)
  if (sum(flat_values >= min & flat_values <= max) == target) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

results = replicate(n, PickCards(1,13,2))
tab = table(results)

# a) Probability five card hand has exactly two hearts
cat("Probability a five card hand has exactly two hearts:",((tab["TRUE"]/n)*100),"%")
p_2hearts_sim = tab["TRUE"]/n 

# b) Probability five card hand has exactly 3 aces
results = replicate(n, PickCards(1,4,3))
tab = table(results)

cat("Probability a five card hand has exactly three aces:",((tab["TRUE"]/n)*100),"%")
p_3aces_sim = tab["TRUE"]/n

# c) Compare simulated vs. theoretical probability of exactly two hearts
p_2hearts_theory = choose(13,2)*choose(39,3)/choose(52,5)
cat("Theoretical probability of exactly two hearts:", p_2hearts_theory*100, "%")
cat("Simulated probability of exactly two hearts:  ", p_2hearts_sim*100, "%")
cat("Difference:", abs(p_2hearts_sim - p_2hearts_theory)*100, "percentage points")

# Extra check: theoretical probability of exactly three aces
p_3aces_theory = choose(4,3)*choose(48,2)/choose(52,5)
cat("Theoretical probability of exactly three aces:", p_3aces_theory*100, "%")
cat("Simulated probability of exactly three aces:  ", p_3aces_sim*100, "%")

# d) Why the simulated probability may not exactly equal the theoretical probability
# The simulation uses a finite number of random hands (1,000,000), so the observed proportion
# has random sampling error. Its standard error is sqrt(p(1-p)/n), about 0.04 percentage points
# here. The proportion tends to get closer to the true probability as n grows, but it will
# almost never match it exactly.
se = sqrt(p_2hearts_theory*(1 - p_2hearts_theory)/n)
cat("Approximate standard error of the simulated estimate:", se*100, "percentage points")


# 14) Combinatorics and Simulation
# Students 1-8 are mathematics majors, students 9-20 are not
n = 10000

# a) Theoretical probability that exactly 2 of the 5 selected are math majors
#    (hypergeometric: choose 2 of 8 majors, 3 of 12 non-majors, out of all C(20,5) committees)
p_2majors_theory = choose(8,2)*choose(12,3)/choose(20,5)
cat("Theoretical probability of exactly 2 math majors:", p_2majors_theory*100, "%")

# b) Simulate 10,000 random committees (5 students chosen without replacement)
Committee = function() {
  members = sample(1:20, 5, replace = FALSE)
  return(sum(members <= 8))   
}

results = replicate(n, Committee())

# c) Estimate the probability that exactly 2 math majors are selected
p_2majors_sim = sum(results == 2)/n
cat("Simulated probability of exactly 2 math majors:", p_2majors_sim*100, "%")

# d) Compare simulated and theoretical probabilities
cat("Absolute difference:", abs(p_2majors_sim - p_2majors_theory)*100, "percentage points")


# 15) Law of Large Numbers
# a) and b) Simulate rolls of a fair die and find the proportion of 6s for each number of rolls
roll_counts = c(10, 100, 1000, 10000, 100000)
prop_sixes = rep(0, length(roll_counts))

for (k in 1:length(roll_counts)) {
  rolls = sample(1:6, roll_counts[k], replace = TRUE)
  prop_sixes[k] = sum(rolls == 6)/roll_counts[k]
}

lln_table = data.frame(Rolls = roll_counts, Proportion_of_6s = prop_sixes, Distance_from_1_6 = abs(prop_sixes - 1/6))
print(lln_table)

# c) Plot the proportion of 6s as the number of rolls increases
plot(roll_counts, prop_sixes, type = "b", log = "x", pch = 16, col = "blue",
     main = "Proportion of 6s vs. Number of Rolls", xlab = "Number of Rolls (log scale)",
     ylab = "Proportion of 6s", ylim = c(0, max(prop_sixes, 1/6) + 0.05))

# d) Horizontal line at the theoretical probability P(6) = 1/6
abline(h = 1/6, col = "red", lty = 2)

# e) Explanation: as the number of rolls grows, the proportion of 6s settles toward 1/6
# (about 0.1667). Small samples (10 rolls) can be far off, while 100,000 rolls is very close,
# which is exactly what the Law of Large Numbers says.
