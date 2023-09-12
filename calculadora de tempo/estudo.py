hora_24h = "16:30"

hora_24h_int = int(hora_24h.replace(":", ""))
hora_12h_int = hora_24h_int % 1200
if hora_12h_int == 0:
    hora_12h_int = 1200

hora_12h_str = str(hora_12h_int)
hora_12h_str = hora_12h_str.zfill(4)
hora_12h_str = hora_12h_str[:2] + ":" + hora_12h_str[2:]
if hora_12h_int >= 1200:
    hora_12h_str += " PM"
else:
    hora_12h_str += " AM"

print(hora_12h_str)