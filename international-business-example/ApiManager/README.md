# ApiManager

El ApiManager contiene toda la lógica de la capa de API de la aplicación.

Capas del paquete:
- Client
    Contiene la configuración del APIClient y los protocolos de RefreshToken y SecureDatabase
    
- Extensions
    Extensiones generales de la capa API
    
- Helpers
    Contiene los StaticMethods necesarios para el API

- Interfaces
    Contiene las Interfaces de comunicación de Body, Headers y los distintos posibles Methods que pueden ser usados en la capa.

- Requests
    Contiene el protocolo que deben implementar las Requests de la app que dependa de este paquete
