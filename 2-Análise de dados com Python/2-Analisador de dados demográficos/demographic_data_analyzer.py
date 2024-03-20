import pandas as pd
import os

def calculate_demographic_data(print_data=True):
    
    df = pd.read_csv(os.path.abspath('2-Análise de dados com Python\\2-Analisador de dados demográficos\\adult.data.csv')) 

    # How many of each race are represented in this dataset? This should be a Pandas series with race names as the index labels.
    race_count = df.race.drop_duplicates()

    # What is the average age of men?
    man_df_sex = df[df['sex'] == 'Male']
    num_sex = man_df_sex.age.count()
    num_sum = man_df_sex.age.sum()
    average_age_men =  round(num_sum / num_sex,2)

    # What is the percentage of people who have a Bachelor's degree?
    educ = df[df['education'] == 'Bachelors']
    num_education = educ.education.count()
    total = df.shape[0]
    percentage_bachelors =  round((num_education / total) * 100, 2)

    # What percentage of people with advanced education (`Bachelors`, `Masters`, or `Doctorate`) make more than 50K?
    # Filter out rows with 'Bachelors', 'Masters', or 'Doctorate' education
    filtered_df_ = df[df['education'].isin(['Bachelors', 'Masters', 'Doctorate'])]
    # Count the number of people with a salary less than or equal to 50K
    upper_than_50k_count = filtered_df_[filtered_df_['salary'] == '>50K'].shape[0]
    

    # Filter out rows with 'Bachelors', 'Masters', or 'Doctorate' education
    filtered_df = df[~df['education'].isin(['Bachelors', 'Masters', 'Doctorate'])]
    # Count the number of people with a salary less than or equal to 50K
    lower_than_50k_count = filtered_df[filtered_df['salary'] == '<=50K'].shape[0]
    

    # What percentage of people without advanced education make more than 50K?

    # with and without `Bachelors`, `Masters`, or `Doctorate`
    higher_education = round((upper_than_50k_count / total)*100,2)
    lower_education = round((lower_than_50k_count / total)*100,2)

    # percentage with salary >50K
    higher_education_rich = None
    lower_education_rich = None

    # What is the minimum number of hours a person works per week (hours-per-week feature)?
    min_work_hours = None

    # What percentage of the people who work the minimum number of hours per week have a salary of >50K?
    num_min_workers = None

    rich_percentage = None

    # What country has the highest percentage of people that earn >50K?
    highest_earning_country = None
    highest_earning_country_percentage = None

    # Identify the most popular occupation for those who earn >50K in India.
    top_IN_occupation = None

    # DO NOT MODIFY BELOW THIS LINE

    if print_data:
        print("Number of each race:\n", race_count) 
        print("Average age of men:", average_age_men)
        print(f"Percentage with Bachelors degrees: {percentage_bachelors}%")
        print(f"Percentage with higher education that earn >50K: {higher_education_rich}%")
        print(f"Percentage without higher education that earn >50K: {lower_education_rich}%")
        print(f"Min work time: {min_work_hours} hours/week")
        print(f"Percentage of rich among those who work fewest hours: {rich_percentage}%")
        print("Country with highest percentage of rich:", highest_earning_country)
        print(f"Highest percentage of rich people in country: {highest_earning_country_percentage}%")
        print("Top occupations in India:", top_IN_occupation)

    return {
        'race_count': race_count,
        'average_age_men': average_age_men,
        'percentage_bachelors': percentage_bachelors,
        'higher_education_rich': higher_education_rich,
        'lower_education_rich': lower_education_rich,
        'min_work_hours': min_work_hours,
        'rich_percentage': rich_percentage,
        'highest_earning_country': highest_earning_country,
        'highest_earning_country_percentage':
        highest_earning_country_percentage,
        'top_IN_occupation': top_IN_occupation
    }


if __name__ == "__main__":
    lol = calculate_demographic_data()
    lol