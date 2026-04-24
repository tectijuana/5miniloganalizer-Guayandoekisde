<img width="1588" height="104" alt="Logo" src="https://github.com/user-attachments/assets/faf54fc3-5829-42d5-bf8d-5d2df5d2a671" />



# Práctica 4.2
Autor: Gomez Cuevas Carlos

No.Control: 23210592

Hora: 5:00 p.m.

Profesor: Rene Solis Reyes


## Implementación de un Mini Cloud Log Analyzer en ARM64

**Modalidad:** Individual
**Entorno de trabajo:** AWS Ubuntu ARM64 + GitHub Classroom (Este programa fue hecho simulado con qemu-aarch64 en una arquitectura x86_64)
**Lenguaje:** ARM64 Assembly (GNU Assembler) + Bash + GNU Make

---

## Introducción

Los sistemas modernos de cómputo en la nube generan continuamente registros (*logs*) que permiten monitorear el estado de servicios, detectar fallas y activar alertas ante eventos críticos.

En esta práctica se desarrollará un módulo simplificado de análisis de logs, implementado en **ARM64 Assembly**, inspirado en tareas reales de monitoreo utilizadas en sistemas cloud, observabilidad y administración de infraestructura.

El programa procesara códigos de estado HTTP y detectara el primer evento critico 503 indicando en que línea del log.txt se encuentra:

```bash id="y1gcmc"
cat logs.txt | ./analyzer
```
```
El primer codigo 503 se encuentra en la linea x
```

---

## Objetivo general

Diseñar e implementar, en lenguaje ensamblador ARM64, una solución para procesar registros de eventos y detectar condiciones definidas según la variante asignada.

---

## Objetivos específicos

El estudiante aplicará:

* programación en ARM64 bajo Linux
* manejo de registros
* direccionamiento y acceso a memoria
* instrucciones de comparación
* estructuras iterativas en ensamblador
* saltos condicionales
* uso de syscalls Linux
* compilación con GNU Make
* control de versiones con GitHub Classroom

Estos temas se alinean con contenidos clásicos de flujo de control, herramientas GNU, manejo de datos y convenciones de programación en ensamblador.   

---

### Variante C

Detectar el primer evento crítico (503).

---

## Compilación

```bash id="bmubtb"
make
```

<p align="center">
<<img src="https://github.com/user-attachments/assets/92d5cfaa-6e55-43a7-8d88-a2d30b6a402f"/>
</p>

## Ejemplo de ejecucion
```
make run
```
<p align="center">
  <img width="557" height="176" alt="image" src="https://github.com/user-attachments/assets/d70d3ee3-f9b4-41bc-bf55-9f706603506a" />
</p>

```
make test
```
<p align="center">
<img width="614" height="363" alt="image" src="https://github.com/user-attachments/assets/d948c4b0-c2c0-4782-9c09-a4f91c041639" />
</p>


---

## Ejecución en el logs_C

```bash id="gcqlf2"
cat logs.txt | ./analyzer
```
<img width="1077" height="144" alt="image" src="https://github.com/user-attachments/assets/841c39a3-ee54-42b4-af08-fe912fc74dbb" />

---
## Ejecucion en un log aleatorio de 1000 eventos

```
cat logs_random.txt | ./analyzer
```
<img width="1152" height="173" alt="image" src="https://github.com/user-attachments/assets/5846137b-b32f-4f63-b2bc-fc15cec2b5b4" />

---
## Demo de ejeucion
Archivo de grabacion: 
- 




