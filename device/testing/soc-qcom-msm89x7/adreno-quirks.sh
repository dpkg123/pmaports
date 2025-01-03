# Various GPU workarounds for Adreno 308 and 505

# The 'ngl' GTK renderer, which is now used by default, has worse
# performance and is somewhat more prone to crashes. Use the 'gl'
# renderer until these issues have been sorted out.
export GSK_RENDERER=gl