def add_time(start, duration, start_day=None):
    # Mapeamento dos dias da semana
    days_of_week = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

    # Dividir a hora de início em horas e minutos
    start_time, meridiem = start.split()
    start_hour, start_minute = map(int, start_time.split(":"))

    # Dividir a duração em horas e minutos
    duration_hour, duration_minute = map(int, duration.split(":"))

    # Calcular o total de minutos
    total_minutes = start_hour * 60 + start_minute + duration_hour * 60 + duration_minute

    # Calcular o novo horário em horas e minutos
    new_hour = total_minutes // 60
    new_minute = total_minutes % 60

    # Calcular se é AM ou PM
    if meridiem == "PM":
        new_hour += 12

    # Calcular o número de dias a serem adicionados
    days_passed = new_hour // 24
    new_hour %= 24

    # Determinar o dia da semana, se fornecido
    if start_day:
        start_day = start_day.lower().capitalize()  # Formatar o dia da semana
        start_day_index = days_of_week.index(start_day)
        new_day_index = (start_day_index + days_passed) % 7
        new_day = days_of_week[new_day_index]
        if days_passed == 1:
            new_time = f"{new_hour}:{new_minute:02} PM, {new_day} (next day)"
        elif days_passed > 1:
            new_time = f"{new_hour}:{new_minute:02} PM, {new_day} ({days_passed} days later)"
        else:
            new_time = f"{new_hour}:{new_minute:02} PM, {new_day}"
    else:
        meridiem = "PM" if new_hour >= 12 else "AM"
        if new_hour >= 12:
            new_hour %= 12
        if new_hour == 0:
            new_hour = 12
        if days_passed == 1:
            new_time = f"{new_hour}:{new_minute:02} {meridiem} (next day)"
        elif days_passed > 1:
            new_time = f"{new_hour}:{new_minute:02} {meridiem} ({days_passed} days later)"
        else:
            new_time = f"{new_hour}:{new_minute:02} {meridiem}"

    return new_time

if __name__ == '__main__':
    actual = add_time("11:59 PM", "24:05", "Wednesday")
    print(actual)