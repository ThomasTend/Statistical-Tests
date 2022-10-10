import scipy.stats as st
import numpy as np

# simulate n height sample points
n = 1000
sigma = 4.5
population_mean = 172
x = st.norm.rvs(loc=population_mean, scale=sigma, size=n)
# Test if mean height is close to our choice of mu_0 using a Z-test with confidence level 95%
mu_0 = 160
observed_z_score = (x.mean()-mu_0) / x.std()
theoretical_z_score = st.norm.ppf(0.975)
print('observed_z_score = ', observed_z_score)
print('theoretical_z_score = ', theoretical_z_score)

"""
observed_z_score =  2.685386192520411
theoretical_z_score =  1.959963984540054
"""

# Build confidence interval at 95% confidence level for the population mean
confidence_interval = (x.mean()-st.norm.ppf(0.975)*sigma / n**0.5, x.mean()+st.norm.ppf(0.975)*sigma / n**0.5)
print(confidence_interval)
"""
(171.89574837818117, 172.45356390725527)
"""

# Simulate n Bernoulli trials with probability of success p
n = 1000
p = 0.2
x = st.bernoulli.rvs(p, size=n)
# Build a confidence interval at 95% confidence level for the true proportion
prop_confidence_interval = (x.mean()-st.norm.ppf(0.975)*(x.mean()*(1-x.mean()) / n)**0.5, x.mean()+st.norm.ppf(0.975)*(x.mean()*(1-x.mean()) / n)**0.5)
print(prop_confidence_interval)
"""
(0.19049454955246573, 0.24150545044753427)
"""

# two-sample Z-test example. 

n_X = 1000
n_Y = 900
sigma_X = 4.5
sigma_Y = 3
mu_X = 172
mu_Y = 169

x = st.norm.rvs(loc=mu_X, scale=sigma_X, size=n_X)
y = st.norm.rvs(loc=mu_Y, scale=sigma_Y, size=n_Y)

# Test if mean height is close to our choice of mu_0 using a Z-test with confidence level 95%
mu_0 = 0
d = x.mean()-y.mean()
obs_two_sample_z_score = (d-mu_0) / (x.var()/n_X+y.var()/n_Y)**0.5
theoretical_z_score = st.norm.ppf(0.975)
print(obs_two_sample_z_score)
print(theoretical_z_score)

"""
18.218656150786675
1.959963984540054
"""

# two-sample confidence interval at 95% confidence level
sigma_d = (x.var()/n_X+y.var()/n_Y)**0.5
two_sample_conf_int = (d-st.norm.ppf(0.975)*sigma_d, d+st.norm.ppf(0.975)*sigma_d)
print(two_sample_conf_int)
"""
(2.6674512966841504, 3.3554710397719263) 
"""

# two-sample proportion confidence interval at 95% confidence level

n_X=1000
p_X=0.09
x = st.bernoulli.rvs(p_X, size=n_X)
n_Y=900
p_Y=0.081
y = st.bernoulli.rvs(p_Y, size=n_Y)
d = x.mean()-y.mean()
sigma_d = (p_X*(1-p_X)/n_X+p_Y*(1-p_Y)/n_Y)**0.5
two_sample_prop_obs_z_score = d/sigma_d
theoretical_z_score = st.norm.ppf(0.975)
print(two_sample_prop_obs_z_score)
print(theoretical_z_score)
"""
3.074381344601097
1.959963984540054
"""

# Generate a confidence interval at 95% confidence level for the difference of the two population means
two_sample_prop_conf_int = (d-st.norm.ppf(0.975)*sigma_d, d+st.norm.ppf(0.975)*sigma_d)
print(two_sample_prop_conf_int)
"""
(0.01429802250265598, 0.06459086638623289)
"""