section
-- 末尾再帰バージョン：境界チェック証明、停止性証明有
def Tail.iCantBelieveItCanSort {α : Type} [Ord α] (arr : Array α) : Array α :=
  let rec loop_i [Ord α] (arr : Array α) (i : Nat) : Array α :=
    let rec loop_j [Ord α] (arr : Array α) (i : Nat) (j : Nat) (inBounds_i : i < arr.size): Array α :=
      if inBounds_j : j < arr.size then
        match Ord.compare arr[i] arr[j] with
        | .lt =>
          -- i < arr.size の証明から i < (arr.swap i j).size の証明を作る
          have inBounds_i' : i < (arr.swap i j).size := by
            simp [Array.size_swap]
            assumption
          loop_j (arr.swap i j) i (j + 1) inBounds_i'
        | .gt | .eq => loop_j arr i (j + 1) inBounds_i
      else
        arr
    if inBounds_i : i < arr.size then
      loop_i (loop_j arr i 0 inBounds_i) (i + 1) -- 内側のループ loop_j に i < arr.size の証明を渡す
    else
      arr

    termination_by arr.size - i
    decreasing_by
      -- Functional induction を用いて証明
      -- https://lean-lang.org/blog/2024-5-17-functional-induction/
      have loop_j_size_eq (arr : Array α) (i : Nat) (j : Nat) (inBounds_i : i < arr.size)
        : (iCantBelieveItCanSort.loop_i.loop_j arr i j inBounds_i).size = arr.size := by
        induction arr, i, j, inBounds_i using iCantBelieveItCanSort.loop_i.loop_j.induct
        <;> (unfold iCantBelieveItCanSort.loop_i.loop_j ; simp [*])
      rw [loop_j_size_eq]
      exact Nat.sub_succ_lt_self arr.size i inBounds_i

  loop_i arr 0

#eval Tail.iCantBelieveItCanSort #[3,1,4,1,5,9,2,6,5,3]


end
