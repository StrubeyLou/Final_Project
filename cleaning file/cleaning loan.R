library(tidyverse)
library(lubridate)
library(skimr)

lending <- read_csv("data/lending_club_loans.csv")
states <- read_csv("data/state_names_info.csv")
grades <- read_csv("data/grade_info.csv")


lending_cleaning <- lending %>% 
  # taking out all of the unneccesary columns
  select(-c(51:114)) %>% 
  select(-c(next_pymnt_d, last_pymnt_amnt, last_credit_pull_d, last_pymnt_d, collection_recovery_fee, recoveries, total_rec_late_fee, total_rec_int, total_rec_prncp, total_pymnt, out_prncp_inv, out_prncp, initial_list_status, revol_util, revol_bal, pub_rec, open_acc, inq_last_6mths, fico_range_high, earliest_cr_line, zip_code, url, pymnt_plan, member_id, id, funded_amnt, funded_amnt_inv)) %>% 
  select(-starts_with("mths_")) %>% 
  mutate(int_rate = str_sub(int_rate, 1, -2)) %>% 
  mutate(int_rate = as.numeric(int_rate)) %>% 
  mutate(emp_title = str_to_lower(emp_title)) %>% 
  mutate(home_ownership = str_to_lower(home_ownership)) %>% 
  mutate(profit_loss = total_pymnt_inv - loan_amnt) %>% 
  filter(loan_status == "Fully Paid" | loan_status == "Charged Off") %>% 
  rename("state_abb" = "addr_state") %>% 
  full_join(states, "state_abb") %>% 
  full_join(grades, "sub_grade") %>% 
  mutate(interest_rate = case_when(
    int_rate > 20 ~ "Very High",
    int_rate > 15 ~ "High",
    int_rate > 10 ~ "Medium",
    int_rate >= 5 ~ "Low",
    int_rate < 5 ~ "Very Low"
  )) %>% 
  drop_na(loan_amnt)


lending_cleaning %>% 
  distinct(loan_status)

lending_cleaning %>% 
  summarise(count = sum(is.na(loan_amnt)))

skimr::skim(lending_cleaning)
