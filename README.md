# 🍷 Galicia Secreta
![Badge de estado](https://img.shields.io/badge/STATUS-COMPLETADO-brightgreen)
![Badge de plataforma](https://img.shields.io/badge/platform-Java%20SE-orange)
![Badge de BD](https://img.shields.io/badge/database-Oracle%2018c-red)

<div align="center">
<img src="https://raw.githubusercontent.com/Motandarina/CRUD-JavaSwing-app/refs/heads/main/java_swing/src/main/resources/img/favicon.png" alt="Galicia Secreta Logo" width="200">

*"Descubre los secretos vitivinícolas de Galicia"*  
Sistema de gestión integral para rutas enoturísticas privadas
</div>

## Índice
- [Descripción del proyecto](#descripción-del-proyecto)
- [Estado del proyecto](#estado-del-proyecto)
- [Características y demostración](#características-y-demostración)
- [Acceso al proyecto](#acceso-al-proyecto)
- [Cómo abrir y ejecutar el proyecto](#cómo-abrir-y-ejecutar-el-proyecto)
- [Arquitectura técnica](#arquitectura-técnica)
- [Tecnologías utilizadas](#tecnologías-utilizadas)
- [Personas desarrolladoras del proyecto](#personas-desarrolladoras-del-proyecto)
- [Licencia](#licencia)

## Descripción del Proyecto
Galicia Secreta es una aplicación de escritorio desarrollada en Java para la gestión  de una empresa turística gallega especializada en rutas enoturísticas privadas. El sistema permite a los coordinadores gestionar clientes, reservas y consultar la información operativa de las visitas a bodegas en las denominaciones de origen gallegas.

Desarrollada como proyecto académico interdisciplinar para las asignaturas de **Programación** y **Base de Datos** del ciclo formativo de Desarrollo de Aplicaciones Multiplataforma (DAM), la aplicación combina una interfaz gráfica intuitiva con una base de datos normalizada.

**🎓 Proyecto Académico Interdisciplinar** - DAM 2023-2024 - IES Fernando Wirtz

## Estado del Proyecto
✅ **Proyecto completado y funcional** ✅

Todas las funcionalidades CRUD implementadas con base de datos completamente operativa.

## Características y Demostración
- 👥 `Gestión completa de clientes`: Operaciones CRUD con validación de datos
- 📋 `Consulta de reservas`: Visualización y filtrado de reservas existentes
- 🔍 `Búsqueda avanzada`: Filtros en tiempo real para tablas de datos
- 📊 `Ordenamiento dinámico`: Tablas ordenables por columnas
- 🎨 `Interfaz intuitiva`: Diseño limpio con navegación por pestañas
- 🏛️ `Base de datos robusta`: Oracle 18c con 16 tablas relacionales
- ⚡ `Connection Pool`: Gestión optimizada de conexiones

### 📸 Capturas de pantalla

<div align="center">
  <img src="https://raw.githubusercontent.com/Motandarina/CRUD-JavaSwing-app/refs/heads/main/res/manage_clients.png" alt="Gestionar Clientes" width="600">
  <img src="https://raw.githubusercontent.com/Motandarina/CRUD-JavaSwing-app/refs/heads/main/res/manage_bookings.png" alt="Gestionar Reservas" width="600">
  <img src="https://raw.githubusercontent.com/Motandarina/CRUD-JavaSwing-app/refs/heads/main/res/filter_client.png" alt="Filtrar Clientes" width="600">
  
</div>
<div align="center">
  <img src="https://raw.githubusercontent.com/Motandarina/CRUD-JavaSwing-app/refs/heads/main/res/add_cliente.png" alt="Añadir Cliente" width="600">
  <img src="https://raw.githubusercontent.com/Motandarina/CRUD-JavaSwing-app/refs/heads/main/res/edit_client.png" alt="Editar Cliente" width="600">
  <img src="https://raw.githubusercontent.com/Motandarina/CRUD-JavaSwing-app/refs/heads/main/res/delete_client.png" alt="Eliminar Cliente" width="600">
</div>

## Funcionalidades principales:
### 👥 Gestión de Clientes (CRUD Completo)
- ✅ Crear nuevos clientes
- ✅ Editar información existente  
- ✅ Eliminar clientes
- ✅ Buscar y filtrar clientes

### 📋 Consulta de Reservas (Solo Lectura)
- ✅ Visualizar todas las reservas
- ✅ Filtrar reservas por criterios
- ✅ Ver detalles de reserva seleccionada

### 🔍 Características Técnicas
- ✅ Filtrado en tiempo real
- ✅ Ordenamiento por columnas
- ✅ Validación de campos obligatorios
- ✅ Gestión de errores SQL
- ✅ Diálogos de confirmación


## Acceso al Proyecto
**Para acceder al código fuente:**

```bash
git clone https://github.com/Motandarina/CRUD-JavaSwing-app.git
```

## Cómo abrir y ejecutar el proyecto

### Requisitos previos
- Java SE 8 o superior
- Oracle Database 18c Express Edition
- Driver JDBC de Oracle (incluido en el proyecto)
- IDE compatible con Java (NetBeans, IntelliJ IDEA, Eclipse)

### 🚀 Instalación y ejecución

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/Motandarina/CRUD-JavaSwing-app.git
   cd galicia-secreta-crud
   ```

2. **Configurar la base de datos:**
   ```sql
   -- Ejecutar script de creación de BD
   @creacionbd.sql
   -- Configurar usuario administrativo
   CREATE USER c##admings IDENTIFIED BY password;
   GRANT ALL PRIVILEGES TO c##admings;
   ```

3. **Configurar conexión:**
   ```java
   // Actualizar credenciales en Pool de conexiones
   String url = "jdbc:oracle:thin:@localhost:1521:xe";
   String username = "c##admings";
   String password = "tu_password";
   ```

4. **Compilar y ejecutar:**
   ```bash
   javac -cp "lib/*" src/GaliciaSecretaApp.java
   java -cp "lib/*:src" GaliciaSecretaApp
   ```

### 🗄️ Estructura de la base de datos

<img src="https://raw.githubusercontent.com/Motandarina/CRUD-JavaSwing-app/refs/heads/main/res/Diagrama%20EER%20Empresa%20Enoturismo.png" alt="EER" width="600">

## Arquitectura Técnica

### 🏗️ Patrón MVC
- **Modelo**: Clases VO (Value Objects) y DAO (Data Access Objects)
- **Vista**: Interfaces gráficas con Java Swing
- **Controlador**: Gestión de eventos y lógica de negocio

### 🗂️ Estructura del proyecto
```
src/
├── controller/
│   ├── factory/      # Factory pattern para DAO
│   ├── pool/         # Connection pool optimizado
│   └── view/         # Controladores de vista
├── model/
│   ├── dao/          # Data Access Objects
│   └── vo/           # Value Objects (Cliente, Reserva)
├── view/             # Interfaz gráfica (Swing)
└── GaliciaSecretaApp.java  # Clase principal
```

### 🔧 Funcionalidades programáticas
- **Procedimientos almacenados**: `CREAR_CLIENTE_CON_CONTRASEÑA`
- **Funciones**: `CALCULAR_DESCUENTO_POR_DIAS`
- **Triggers**: Control automático de disponibilidad
- **Vistas**: `RUTAS_RESERVAS` para coordinadores

## Tecnologías utilizadas

### 💻 Frontend Desktop
- **Java SE 8+** - Lenguaje principal de desarrollo
- **Java Swing** - Framework para interfaz gráfica
- **MVC Pattern** - Arquitectura Modelo-Vista-Controlador
- **DAO Pattern** - Patrón de acceso a datos

### 🗄️ Backend & Base de Datos
- **Oracle Database 18c XE** - Sistema de gestión de base de datos
- **JDBC** - Conectividad con base de datos
- **Connection Pool** - Gestión optimizada de conexiones
- **PL/SQL** - Procedimientos y funciones almacenadas

### 🏗️ Patrones de Diseño
- **MVC** - Separación de responsabilidades
- **DAO** - Abstracción del acceso a datos
- **Factory Pattern** - Creación de objetos DAO
- **Connection Pool** - Gestión eficiente de recursos

## Personas desarrolladoras del proyecto
| Lucía Méndez Rodríguez |
| :---: |
| *Técnico Superior en DAM* | 
| *Licenciada en Filología Hispánica* |

**📚 Contexto académico**: Proyecto interdisciplinar - DAM 2023-2024 - IES Fernando Wirtz

### 🎯 Logros técnicos
- Implementación completa del patrón MVC
- Base de datos normalizada con 16 tablas relacionales
- Sistema de Connection Pool optimizado
- Interfaz gráfica intuitiva
- Gestión automática de disponibilidad con triggers
- Validación robusta de datos de entrada

### 🏆 Asignaturas integradas
- **Programación**: Desarrollo de la aplicación Java con patrones de diseño
- **Base de Datos**: Modelado EER, normalización y programación PL/SQL

---
### 🌿 Inspiración
*Dedicado a la rica tradición vitivinícola de Galicia.*

**Datos de bodegas**: Basado en las cinco denominaciones de origen gallegas y sus variedades de uva autóctonas.
