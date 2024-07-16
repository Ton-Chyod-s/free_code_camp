import pandas as pd
import os

def calculate_demographic_data(print_data=True):
    
    df = pd.read_csv(os.path.abspath('2-Análise de dados com Python\\2-Analisador de dados demográficos\\adult.data.csv')) 

    #Quantas pessoas de cada raça estão representadas neste dataset? Esta deve ser uma série Pandas com nomes das raças como rótulos de índice. (coluna race)
    race_count = df.race.value_counts()

    #Qual é a média de idade dos homens?
    man_df_sex = df[df['sex'] == 'Male']
    num_sex = man_df_sex.age.count()
    num_sum = man_df_sex.age.sum()
    average_age_men =  round(num_sum / num_sex,2)

    #Qual é a porcentagem de pessoas que têm um diploma de bacharel?
    educ = df[df['education'] == 'Bachelors']
    num_education = educ.education.count()
    total = df.shape[0]
    percentage_bachelors =  round((num_education / total) * 100, 2)

    #Qual é a porcentagem de pessoas com educação superior (Bachelors, Masters, ou Doctorate - graduados, mestres e doutores, respectivamente) que ganham mais de 50 mil?
    filtered_df_ = df[df['education'].isin(['Bachelors', 'Masters', 'Doctorate'])]
    upper_than_50k_count = filtered_df_[filtered_df_['salary'] == '>50K'].shape[0]
    
    #Qual é a porcentagem de pessoas sem educação superior que ganham mais de 50 mil?
    filtered_df = df[~df['education'].isin(['Bachelors', 'Masters', 'Doctorate'])]
    lower_than_50k_count = filtered_df[filtered_df['salary'] == '>50K'].shape[0]
    
    higher_education_rich = round((upper_than_50k_count / total) * 100, 2)
    lower_education_rich = round((lower_than_50k_count / total) * 100, 2)

    #Qual é o número mínimo de horas que uma pessoa trabalha por semana?
    min_work_hours = min(df['hours-per-week'])
    
    #Qual é a porcentagem das pessoas que trabalham o número mínimo de horas por semana e que têm um salário superior a 50 mil??
    num_min_workers = df[(df['hours-per-week'] == min_work_hours) & (df['salary'] == '>50K')].shape[0]

    print(round((num_min_workers / total)*100,3))
    
    #Qual país tem a maior porcentagem de pessoas que ganham > 50mil e qual é essa porcentagem?
    pais_porcentagem = []
   
    for value in filtered_df_['native-country'].unique():
        pais = filtered_df_[filtered_df_['native-country'] == value].age.count()
        porcentagem = round((pais / total) * 100,2)
        if len(pais_porcentagem) == 0:
            pais_porcentagem.append(value)
            pais_porcentagem.append(porcentagem)
        else:
            if pais_porcentagem[1] < porcentagem:
                pais_porcentagem[0] = value
                pais_porcentagem[1] = porcentagem
   
           
    # Identify the most popular occupation for those who earn >50K in India.
    top_IN_occupation = filtered_df_[filtered_df_['native-country'] == 'India'].age.count()
    

    # DO NOT MODIFY BELOW THIS LINE

    if print_data:
        print("Number of each race:\n", race_count) 
        print("Average age of men:", average_age_men)
        print(f"Percentage with Bachelors degrees: {percentage_bachelors}%")
        print(f"Percentage with higher education that earn >50K: {higher_education_rich}%")
        print(f"Percentage without higher education that earn >50K: {lower_education_rich}%")
        print(f"Min work time: {min_work_hours} hours/week")
        print(f"Percentage of rich among those who work fewest hours: {0}%")
        print("Top occupations in India:", top_IN_occupation)

    return {
        'race_count': race_count,
        'average_age_men': average_age_men,
        'percentage_bachelors': percentage_bachelors,
        'higher_education_rich': higher_education_rich,
        'lower_education_rich': lower_education_rich,
        'min_work_hours': min_work_hours,
        'rich_percentage': 0,
        'top_IN_occupation': top_IN_occupation
    }


if __name__ == "__main__":
    lol = calculate_demographic_data()
    lol