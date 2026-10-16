# NODO CERO

Aventura de ficción interactiva en Inform 7 / Glulx — en desarrollo.

**Género:** Thriller hacker · Misterio · Drama histórico  
**Ambientación:** Madrid, octubre de 1994  
**Motor:** Inform 7 10.1.2 · SpanishLanguageKit r10.1 · Glulx

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

Requiere [Inform 7 10.1.2](https://ganelson.github.io/inform-website/) con [SpanishLanguageKit r10.1](https://github.com/i7/extensions/tree/master/Sebastian%20Arg/Spanish%20Language).

**⚠️ Compilar siempre a Glulx** — SpanishLanguageKit no es compatible con Z-machine.

```
ni --format=Inform6/32 --project nodo_cero.inform
inform6 -G -v8 -E2 -~S <auto.inf> nodo_cero.ulx
```

El `.ulx` resultante se puede jugar con [Gargoyle](https://github.com/garglk/garglk), [Lectrote](https://github.com/erkyrath/lectrote) o cualquier intérprete Glulx.

---

## Sobre VampireBBS

[VampireBBS](https://www.vampirebbs.org) — BBS madrileña de los años 80-2000, renacida en 2026.  
FidoNet nodo 2:341/202.

---

© 2026 VampireBBS / Vampsecure Studios
