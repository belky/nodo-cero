# NODO CERO

Aventura de ficción interactiva en Inform 7 / Glulx — en desarrollo.

**Género:** Thriller hacker · Misterio · Drama histórico  
**Ambientación:** Madrid, octubre de 1994  
**Motor:** Inform 7 10.1.2 · Glulx (soporte español nativo, sin extensiones)

---

## Historia

Madrid, 23 de octubre de 1994. Son las 23:15.

El módem de Caverna-7 acaba de recibir un paquete FidoNet de un nodo que lleva tres años muerto. El sysop de ese nodo murió en un accidente de tráfico en octubre del 91.

El mensaje tiene fecha de 1991. Tiene una clave cifrada. Tiene una dirección.

Alguien murió para enviarlo.

---

## Estado del desarrollo

| Acto | Título | Estado |
|---|---|---|
| Acto I | La Caverna | ✅ En desarrollo |
| Acto II | La Red | 🔲 Pendiente |
| Acto III | El Archivo | 🔲 Pendiente |
| Acto IV | El Origen | 🔲 Pendiente |

**Puntuación total:** 1000 puntos (250 por acto).  
**Acto I:** 250 puntos — seis puzles, tres NPCs, dos mundos (físico / digital).

---

## Cómo compilar

Requiere [Inform 7 10.1.2](https://ganelson.github.io/inform-website/). Sin extensiones adicionales — el soporte español (verbos, direcciones, mensajes de parser) está integrado directamente en el fuente.

**Compilar siempre a Glulx (formato 32 bits):**

```
ni --format=Inform6/32 --project nodo_cero.inform
inform6 -G -E2 -~S output.inf nodo_cero.ulx
```

O abre `nodo_cero.inform` con la aplicación Inform.app y pulsa **Go**.

**Importante:** no usar la flag `-v8` de inform6. Con `-v8` el compilador genera Glulx versión 8.x en lugar de 3.1.x, lo que rompe la compatibilidad con los intérpretes actuales.

## Cómo jugar

El intérprete recomendado es **[Lectrote](https://github.com/erkyrath/lectrote)** — moderno, multiplataforma, compatible con Inform 7 10.1.2 al 100%.

El `.ulx` también funciona en Inform.app (intérprete integrado) y en cualquier intérprete Glulx moderno.

> **Nota sobre Gargoyle:** Gargoyle funciona con esta versión del juego, pero su intérprete Glulx interno (Git 1.3.8, de 2014) no soporta todas las características de Inform 7 10.x. Se recomienda Lectrote para una experiencia completa.

---

## Sobre VampireBBS

[VampireBBS](https://www.vampirebbs.org) — BBS madrileña de los años 80-2000, renacida en 2026.  
FidoNet nodo 2:341/202.

---

© 2026 VampireBBS / Vampsecure Studios
