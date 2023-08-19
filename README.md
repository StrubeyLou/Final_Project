# Final_Project - LendingClub


For the final project I decided to take the data from US Fintech LendingClub which is a loans company which was the first to introduce peer to peer where lending where people could invest in loans on the secondary market. The company's business model is for people to apply for loans where LendingClub makes a page for them with the lenders details and a loan score. Investors then pick which loans they would like to back where they make money off the interest. LendingClub then make their money by charging an origintor fee to the investor and an admin fee to the lender. 

What LendingClub tasked us to do was to investigate the default rate and if there were any types of loans that should either be avoided or encouraged. 

In exchange LendingClub gave us a colossal dataset of 40,000 different loans from 2007 to 2011 where the loans were either paid off after 3 or 5 years. The original file included 114 columns which included the lenders personal and financial history. Many of these were removed when data cleaning due to them being irrelevant or containing too many NAs. 

When looking through the data I found the average default rate was 14.5% to 85.5% fully paid loans. 

When looking into the data I found that the lending grade that borrowers were given was a pretty apt as the grade was rated from A to G with A being the highest. The lower the grade the higher the interest rate that was paid as the loan was perceived as riskier. What I wanted to do was see if I could make a better prediction model so I made a logistic regression model called the Finance Model where I measured the lenders annual income, fico credit score, interest rate, dti (debt to loan ratio) and lending term. 

Whilst they were close I did find the financial model was slightly better than the grading score with the financial model having an AUC of 0.68 vs the grading model having a score of 0.65 which is not significant but when thousands of dollars on the line for investments every predictive point counts. 

What I also did was measured the profitability of each loan which I did by subtracting the loan amount vs the amount paid. If the loan was completed this would account for the profit made from interest. If the loan defaulted this would measure how great the loss was. I then used this profitability to compare the reasons for the loan as a total sum from all the data. 

Interestingly enough there was a great difference between reasons for the loan with debt consolidating being incredibly profitable whereas starting a small business generated a very high loss. Therefore I would recommend either no longer accepting loans for starting a small business or at least giving them a higher interest rate to recoup the losses. 

I also did the same for different US states which were drastically different with New York being the most profitable and Nevada being the biggest loss generator. I broke these states average finances down even further and found there was very little difference in any of their earning potential of the earner. So I would recommend putting into account which state the lender comes from with a higher interest rate to recoup for the losses. 

Thank you very much for reading and will happily answer any questions if you have them. 