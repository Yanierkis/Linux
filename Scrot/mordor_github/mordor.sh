echo "Hola"
DISPLAY=:0 xrandr --output "HDMI-2" --primary --scale 0.5x0.5   #Para redimensionar la pantalla
hora=$(/bin/date +%H)
date=$(/bin/date +%d/%m/%Y-%H:%M:%S)
DISPLAY=:0 scrot file144.png #Hacemos la captura de pantalla, es 144 porque estamos en la de economía
convert file144.png -gravity Center -region -40+20 -font Waree-Oblique -pointsize 40 -size 80 -undercolor black -fill yellow -draw "text 13,1 \"$date\"" file144_$hora.png
#Pasar la imagen por certificado o por ssh, lo pasamos primero a otra rp para probar que funciona (la 105), luego ponemos la buena
scp -f "password" file144_$hora.png oculuspi@direccionip:/home/oculuspi/global_prueba
#borrar las dos imagenes 
#Luego fuera configuramos todas las rp para que ejecuten este programa cada hora 
echo "Adios"


