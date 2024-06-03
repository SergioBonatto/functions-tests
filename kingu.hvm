(gen) = λa λb (switch a { 0: λc c; _: gen__C0; } b)

(sum) = λa λb (switch a { 0: λc c; _: sum__C0; } b)

(swap) = λa λb λc (switch a { 0: swap__C0; _: swap__C1; } c b)

(warp) = λa λb λc λd (switch a { 0: warp__C0; _: warp__C1; } d c b)

(flow) = λa λb λc (switch a { 0: λd λ* d; _: flow__C0; } c b)

(down) = λa λb λc (switch a { 0: λd λ* d; _: down__C0; } c b)

(sort) = λa λb λc (switch a { 0: λd λ* d; _: sort__C0; } c b)

(main) = (sum 9 main__C1)

(down__C0) = λa let {b c} = a; λd λe let {f g} = e; let (h, i) = d; ((flow b f h), (flow c g i))

(flow__C0) = λa let {b c} = a; λd λe let {f g} = e; let (h, i) = d; (down (+ b 1) f (warp c g h i))

(gen__C0) = λa let {b c} = a; λd let {e f} = d; ((gen b (+ (* e 2) 1)), (gen c (* f 2)))

(main__C0) = (gen 9 0)

(main__C1) = (sort 9 0 main__C0)

(sort__C0) = λa let {b c d} = a; λe λf let (g, h) = e; (flow (+ b 1) f (sort c 0 g) (sort d 1 h))

(sum__C0) = λa let {b c} = a; λd let (e, f) = d; (+ (sum b e) (sum c f))

(swap__C0) = λa λb (b, a)

(swap__C1) = λ* λa λb (a, b)

(warp__C0) = λa let {b c} = a; λd let {e f} = d; λg (swap (+ g (> e b)) f c)

(warp__C1) = λa let {b c} = a; λd λe λf let {g h} = f; let (i, j) = e; let (k, l) = d; let (m, n) = (warp b g i k); let (o, p) = (warp c h j l); ((m, o), (n, p))
