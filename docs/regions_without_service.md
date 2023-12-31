# Regiones sin servicio

La tabla verde de LUMA Energy que actualizan en su página ["Estatus del servicio"](https://miluma.lumapr.com/outages/serviceStatus) cada 5 minutos. Valores históricos desde finales de Julio 2023.

## Schema
**Tabla:** regions_without_service

| column_name                        | column_type | null |
|------------------------------------|-------------|------|
| timestamp                          | TIMESTAMP   | YES  |
| timestamp_saved                    | TIMESTAMP   | YES  |
| type                               | VARCHAR     | YES  |
| region_name                        | VARCHAR     | YES  |
| total_clients                      | BIGINT      | YES  |
| total_clients_without_service      | BIGINT      | YES  |
| total_clients_with_service         | BIGINT      | YES  |
| percentage_clients_without_service | DOUBLE      | YES  |
| percentage_clients_with_service    | DOUBLE      | YES  |

Una captura de la tabla se compone de las siguientes filas:
![Snippet de la tabla regions_without_service](assets/snippet_regions_without_service.png)

## Descripción

Esta tabla se basa en la tabla de Estatus de Servicio de LUMA. Dicha tabla cambia cada 5 minutos. Este dataset de regiones sin servicio archiva los valores históricos de la tabla de LUMA al mismo ritmo. 

![Snippet de la tabla de Estatus de Servicio de LUMA ](assets/snippet_luma_estatus_servicio.png)

La variable "timestamp" contiene a la fecha y hora de "Última Actualización" que LUMA provee y actualiza cada 5 minutos. Esta hora está en timezone de Puerto Rico. Mientras tanto, "timestamp_saved" indica cuando el bot archivó la información y utiliza el timezone UTC.

Variable "type" distingue filas que representan valores regionales ('region') de las que presentan totales a nivel isla ('totals'). Filas con valores regionales mencionan la región en "region_name".

Otro detalle es que las dos variables de porcentaje no estan normalizadas. Un valor de 100% corresponde a un 100.0 en vez de 1.0. Esto es para mantenerse fiel a como LUMA presenta el dato. Si un número más preciso es requerido, recalcule los porcentajes con las columnas de totales de clientes.

El orden de variables recomendado para sort la tabla es: "timestamp", "type", "region_name"

