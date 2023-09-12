def add_time(start, duration,day=None):
    inicio = start
    duracao = duration
    days_of_week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    def hora(txt):
        hora_dividida = txt.split()
        hh, mm = map(int, hora_dividida[0].split(':'))
        try:
            if 'PM' in hora_dividida[1]:
                hh += 12
        except:
            pass
        return hh * 60 + mm

    def format_time(minutes):
        hh = minutes // 60
        mm = minutes % 60
        period = 'AM'
        if hh >= 12:
            period = 'PM'
            if hh > 12:
                hh -= 12
        if hh == 0:
            hh = 12
        # Remover o zero à esquerda se a hora for menor que 10
        hh_str = str(hh)
        mm_str = str(mm).rjust(2, '0')  # Garante que os minutos tenham pelo menos dois dígitos

        return f'{hh_str}:{mm_str} {period}'
        
    minutos_inicio = hora(inicio)
    minutos_duracao = hora(duracao)
    
    total_minutos = minutos_inicio + minutos_duracao
    
     # Cálculo de dias e tempo final formatado
    days = total_minutos // (24 * 60)
    final_minutes = total_minutos % (24 * 60)
    final_time = format_time(final_minutes) 

    if day != None:
        novo_dia =  days_of_week.index(day)
        next_index = (novo_dia + days) % 7
        next_day = days_of_week[next_index]

    # Imprimir resultado
    if days == 0:
        if day:
            result = f'{final_time}, {day}'
        else:
            result = final_time
    elif days == 1:
        if day:
            result = f'{final_time}, {next_day} (next day)'
        else:
            result = f'{final_time} (next day)'
    else:
        if day:
            result = f'{final_time}, {next_day} ({days} days later)'
        else:
            result = f'{final_time} ({days} days later)'

    return result

if __name__ == '__main__':
    print(add_time("2:59 AM", "24:00", "Saturday"))

