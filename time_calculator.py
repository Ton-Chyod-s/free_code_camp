import time


def add_time(start, duration):
    hora_atual = time.localtime().tm_hour
    minuto_atual = time.localtime().tm_min

    periodo = "AM" if hora_atual < 12 else "PM"

    # Converta para o formato de 12 horas
    if hora_atual == 0:
        hora_atual = 12  # 12:00 AM
    elif hora_atual > 12:
        hora_atual -= 12

    # Formate a hora e os minutos
    hora_formatada = f"{hora_atual:02}:{minuto_atual:02} {periodo}"

    print(f"Hora atual no formato de 12 horas: {hora_formatada}")


if __name__ == '__main__':
  add_time(1,2)