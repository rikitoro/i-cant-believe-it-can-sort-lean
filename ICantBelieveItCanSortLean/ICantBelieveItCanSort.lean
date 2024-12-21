/--
  I can't believe it can sort の Lean による実装
-/

-- 境界チェック無し バージョン
def ICantBelieveItCanSort! {α : Type} [Inhabited α] [Ord α] (arr : Array α) : Array α := Id.run do
  let mut arr := arr
  for i in [0:arr.size] do
    for j in [0:arr.size] do
      match Ord.compare arr[i]! arr[j]! with
      |.lt => arr := arr.swapIfInBounds i j
      |.gt |.eq  => pure ()
  arr

#eval ICantBelieveItCanSort! #[3,1,4,1,5,9,2,6,5,3]
-- #[1, 1, 2, 3, 3, 4, 5, 5, 6, 9]

-- 境界チェック証明あり バージョン
--  証明はこちらを参照 https://zenn.dev/link/comments/e3a8a5992e5788
def ICantBelieveItCanSort {α : Type} [Ord α] (arr : Array α) : Array α := Id.run do
  let size := arr.size
  let mut arr : {arr : Array α // arr.size = size } := ⟨arr, rfl⟩
  for hi : i in [0:size] do
    for hj : j in [0:size] do
      have hi' : i < size := hi.upper
      have hj' : j < size := hj.upper
      match Ord.compare arr.val[i] arr.val[j] with
      |.lt => arr := ⟨arr.val.swap i j, by rw [Array.size_swap, arr.property]⟩
      |.gt |.eq  => pure ()
  arr.val

#eval ICantBelieveItCanSort #[3,1,4,1,5,9,2,6,5,3]
-- #[1, 1, 2, 3, 3, 4, 5, 5, 6, 9]
