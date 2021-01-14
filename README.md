# Задание

Между двумя виртуалками поднять vpn в режимах
tun
tap Прочуствовать разницу.
Поднять RAS на базе OpenVPN с клиентскими сертификатами, подключиться с локальной машины на виртуалку

# Решение
## TUN
- перейдите в каталог tun
- выполните команду 

       $ vagrant up

- после подъема стенда выполнте вход на server и client в отдельных терминалах

      $ vagrant ssh client
      $ vagrant ssh server

- Выполните повышение полномочий на клиенте и сервере

      $ sudo -i
      
- На server запустите приложение iperf3 в режиме сервер

      $ iperf3 -s &

- На client запустите приложение iperf3 в режиме слиента

      $ iperf3 -c 10.10.10.1 -t 40 -i 5

- Результаты теста скорости в режиме работы TUN:

![alt text](https://github.com/RaibeartRuadh/myvpn/tun/pic1.png "server tun")

![alt text](https://github.com/RaibeartRuadh/myvpn/tun/pic2.png "client tun")









