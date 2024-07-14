#!/bin/bash

# Obtient les informations sur l'architecture système en utilisant uname -a.
arc=$(uname -a)

# pcpu : Obtient le nombre de sockets CPU physiques à partir de lscpu.
pcpu=$(lscpu | grep "Socket(s)" | awk '{print $2}')

# vcpu : Obtient le nombre de processeurs logiques (vCPU) en utilisant nproc.
vcpu=$(nproc)

# fram : Affiche la mémoire utilisée en MB, le total de la mémoire en MB, et le pourcentage de mémoire utilisée.
fram=$(free -m | grep Mem | awk '{printf("%s/%sMB (%.2f%%)", $3, $2, ($3 * 100)/$2)}')

# fdisk : Affiche l'utilisation du disque (utilisé/total et pourcentage) pour tous les systèmes de fichiers.
fdisk=$(df -h --total | grep "total" | awk '{printf("%s/%s (%.1f%%)", $3, $2, ($3*100)/$2)}')

# cpul : Affiche la charge CPU en pourcentage en utilisant top.
cpul=$(top -bn1 | grep "Cpu" | awk '{printf("%.1f%%", ($2 + $4 + $6))}')

# lb : Affiche la date et l'heure du dernier démarrage du système en utilisant who -b.
lb=$(who -b | awk '{printf("%s %s", $3, $4)}')

# lvmu : Vérifie si LVM (Logical Volume Manager) est utilisé en comptant les occurrences de LVM dans la sortie de lsblk.
lvmu=$(lsblk | grep LVM | wc -l | awk '{if ($0) {print "yes"} else {print "no"}}')

# ctcp : Compte le nombre de connexions TCP établies en utilisant netstat.
ctcp=$(netstat | grep "ESTABLISHED" | wc -l)

# ulog : Compte le nombre d'utilisateurs connectés en utilisant who -u.
ulog=$(who -u | wc -l)

# ip : Obtient l'adresse IP de la machine en utilisant hostname -I.
ip=$(hostname -I)

# mac : Obtient l'adresse MAC de l'interface réseau enp0s3.
mac=$(cat /sys/class/net/enp0s3/address)

# cmds : Compte le nombre de commandes sudo exécutées en analysant les journaux système avec journalctl.
cmds=$(journalctl -q | grep sudo | wc -l)

# wall : Envoie toutes les informations collectées aux utilisateurs connectés.
wall " #Architecture: $arc
 #CPU physical: $pcpu
 #vCPU: $vcpu
 #Memory Usage: $fram
 #Disk Usage: $fdisk
 #CPU load: $cpul
 #Last boot: $lb
 #LVM use: $lvmu
 #Connections TCP: $ctcp ESTABLISHED
 #User log: $ulog
 #Network: IP $ip ($mac)
 #Sudo: $cmds cmd"
