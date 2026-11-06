<!-- kapsca-brand v1 (vendored copy of KapsCa/kapsca-brand; do not edit manually) -->
<p align="center"><img src="assets/brand/banner.png" alt="KapsCa" width="700"></p>
<!-- /kapsca-brand -->


# TareaSUD-Musica 🎵

App de **prueba móvil** hecha en Flutter (tarea de desarrollo móvil para **sudSolutions**).
No es un producto completo: el objetivo es ejercitar el stack — **Clean Architecture** y **GetX** — sobre una app chica y real.

## Arquitectura
Este proyecto sigue una estructura modular para asegurar escalabilidad y mantenibilidad:
- **Presentation Layer**: Widgets y Controllers (GetX).
- **Domain Layer**: Modelos de datos y abstracciones (Interfaces).
- **Data Layer**: Repositorios y Providers (implementación del Repository Pattern).

## Características
- ✅ **Repository Pattern**: Desacoplamiento total entre lógica y datos.
- ✅ **Inyección de Dependencias**: Gestión eficiente con GetX Bindings.
- ✅ **TDD Ready**: Suite de pruebas unitarias implementada (Fakes over Mocks).

## Requisitos
- Flutter SDK: `^3.6.0`

## Instalación
```bash
git clone git@github.com:KapsCa/TareaSUD---Musica.git
cd TareaSUD---Musica
flutter pub get
flutter run
```

## Testing
Para ejecutar la suite de pruebas:
```bash
flutter test
```

## Contribución y Conventional Commits
Este proyecto utiliza `release-please` para la automatización de releases. **Es obligatorio** seguir el estándar de [Conventional Commits](https://www.conventionalcommits.org/):
- `feat:` para nuevas funcionalidades.
- `fix:` para correcciones de bugs.
- `docs:` para cambios en documentación.
- `chore:` para mantenimiento o configuración.
