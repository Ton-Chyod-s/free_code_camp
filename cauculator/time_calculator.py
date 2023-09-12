def add_time(start, duration):
    inicio = start
    duracao = duration

    def hora(txt):
       try:
        hora_dividida = txt.split(":")
        hor = int(hora_dividida[0])
        minuto_sem_indicador = hora_dividida[1].split(" ")
        minuto = int(minuto_sem_indicador[0])
        return hor, minuto, minuto_sem_indicador[1]
       except:
          return hor, minuto
        
    hora_inicio = hora(inicio)[0]
    minuto_inicio = hora(inicio)[1]
    hora_duracao = hora(duracao)[0]
    minuto_duracao = hora(duracao)[1]
    
    soma_hora = hora_inicio + hora_duracao
    soma_minuto  = minuto_inicio + minuto_duracao   

    if hora_duracao >= 24:
        # dias
        dia = hora_duracao / 24
        if dia % 1 != 0.0:
           dia = int(hora_duracao / 24) + 1
        
        dias_extras = float(hora_duracao / 24)
        minutos_extras = (dias_extras % 1) 
        # minutos_extras = str(round(minutos_extras,2)).split('.')
        # minutos_extras = int(minutos_extras[1])
        
        minutos_extras = minutos_extras * 60
        hora_duracao = 0
        soma_hora = hora_inicio + hora_duracao
        

    # Verificar se os minutos ultrapassam 60 e ajustar as horas e minutos
    if soma_minuto >= 60:
        soma_hora += 1
        soma_minuto -= 60
    
    resultado_hora = "{}:{:02d}".format(soma_hora, soma_minuto)
    # Dividir a hora formatada em horas e minutos
    hora_ = resultado_hora.split(':')
    hora_ = int(hora_[0])

    if hora_ <= 12:
        if dia > 2:
            print(F'{resultado_hora} AM ({dia} days later)')
        elif dia == 1:
            print(F'{resultado_hora} AM (next day)')
        else:
            print(F'{resultado_hora} AM') 

    elif hora_ < 18:
       print(F'{resultado_hora} PM') 

if __name__ == '__main__':
    add_time("6:30 PM", "205:12")
    # Returns: 7:42 AM (9 days later)
    add_time("11:43 PM", "24:20")
    # Returns: 12:03 AM, Thursday (2 days later)