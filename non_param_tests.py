import matplotlib.pyplot as plt
import scipy.stats as sp
import numpy as np

# Generate Levy stable samples and plot their histogram

fig, ax = plt.subplots(1,2)


x = sp.levy_stable.rvs(alpha=1.8, beta=0.75, size=1000, loc=0, scale=1, random_state=1)
y = sp.levy_stable.rvs(alpha=1.8, beta=0, loc=0, scale=1, size=1000, random_state=1)

ax[0].hist(x, label="measurement 1", alpha=0.5)
ax[0].hist(y, label="measurement 2", alpha=0.5)
ax[0].legend(loc='upper left', frameon=True)

# Test non-normality : KS

print(sp.kstest((x-sp.tmean(x))/sp.tstd(x), 'norm'))
print(sp.kstest((y-sp.tmean(y))/sp.tstd(y), 'norm'))

"""
OUTPUT:
KstestResult(statistic=0.07137022043606722, pvalue=7.111488666703391e-05)
KstestResult(statistic=0.0596811064838742, pvalue=0.0015424045936576125)
"""

# Run Wilcoxon signed-rank test

print(sp.wilcoxon(x, y))
"""
OUTPUT:
WilcoxonResult(statistic=137864.0, pvalue=8.8311453472431e-35)
"""

# Run a Mann-Whitney U test

u = sp.levy_stable.rvs(alpha=1.8, beta=0.99, size=10000, random_state=1)
v = sp.levy_stable.rvs(alpha=1.3, beta=0, size=10000, random_state=1)

print(sp.mannwhitneyu(u,v))

# Run a Kruskal-Wallis test on 3 samples

w = sp.levy_stable.rvs(alpha=1.8, beta=0.99, size=10000, random_state=1)

print(sp.kruskal(u,v,w))

# Run a Friedman test

print(sp.friedmanchisquare(u,v,w))

# define plots of stable distributions

min_arg = min(sp.levy_stable.ppf(0.001, alpha=1.8, beta=0.75, loc=0, scale=1), sp.levy_stable.ppf(0.001, alpha=1.8, beta=0, loc=0, scale=1))
max_arg = max(sp.levy_stable.ppf(0.999, alpha=1.8, beta=0.75, loc=0, scale=1), sp.levy_stable.ppf(0.999, alpha=1.8, beta=0, loc=0, scale=1))
arg_range = np.linspace(min_arg, max_arg, 100)

f1 = sp.levy_stable.pdf(arg_range, alpha=1.8, beta=0.75, loc=0, scale=1)
f2 = sp.levy_stable.pdf(arg_range, alpha=1.8, beta=0, loc=0, scale=1)

ax[1].plot(arg_range, f1)
ax[1].plot(arg_range, f2)

# show all the plots

plt.show()

