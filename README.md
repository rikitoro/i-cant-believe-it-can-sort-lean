# I can't believe it can sort アルゴリズムの Lean 4 による実装

Fung[1] にて示されたソートアルゴリズム ``ICantBelieveItCanSort`` を Lean 4 にて実装する。

```ruby 
# ICantBelieveItCanSort(A[1..n]) 
#   sorts an array A in non-decreasing order 
for i = 1 to n do 
  for j = 1 to n do
    if A[i] < A[j] then
      swap A[i] , A [j]
```

Lean 4 での実装は nesken7777氏による Zenn での記事 "Lean4でバブルソートを書く" [2] をもとに行った。

実装したファイルはこちら : 
- For バージョン : [ICantBelieveItCanSort.lean](./ICantBelieveItCanSortLean/ICantBelieveItCanSort.lean) 
- 末尾再帰バージョン : [TailICantBelieveItCanSort.lean](./ICantBelieveItCanSortLean/TailICantBelieveItCanSort.lean) 

## 参考文献
[1] Stanley P. Y. Fung, "Is this the simplest (and most surpring) sorting algorithm ever?", arXiv:2110.01111v1, https://arxiv.org/abs/2110.01111, 2021.

[2] nesken7777, "Lean4でバブルソートを書く", Zenn エンジニアのための情報共有コミュニティ, https://zenn.dev/nesken7777/articles/lean4-bubblesort (2024-12-12 アクセス).

[3] Joachim Breitner, "Functional induction", LEAN BLOG, https://lean-lang.org/blog/2024-5-17-functional-induction/ (2024-12-30 アクセス).
