/-
Copyright (c) 2016 Microsoft Corporation. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Leonardo de Moura
-/
import Mathlib.Mathport.Rename
import Mathlib.Init.Data.Nat.Notation
import Std.Data.Nat.Lemmas
import Std.Data.List.Basic
/-!
Definitions for `List` not (yet) in `Std`
-/


open Decidable List

universe u v w

namespace List



open Option Nat

#align list.nth List.get?

/-- nth element of a list `l` given `n < l.length`. -/
@[deprecated get]
def nthLe (l : List α) (n) (h : n < l.length) : α := get l ⟨n, h⟩
#align list.nth_le List.nthLe

set_option linter.deprecated false in
@[deprecated]
theorem nthLe_eq (l : List α) (n) (h : n < l.length) : nthLe l n h = get l ⟨n, h⟩ := rfl

/-- The head of a list, or the default element of the type is the list is `nil`. -/
@[simp] def headI [Inhabited α] : List α → α
| []       => default
| (a :: _) => a
#align list.head List.headI

#align list.map₂ List.zipWith

#noalign list.map_with_index_core

#align list.map_with_index List.mapIdx

/-- Find index of element with given property. -/
@[deprecated findIdx]
def findIndex (p : α → Prop) [DecidablePred p] : List α → ℕ := List.findIdx p
#align list.find_index List.findIndex

#align list.update_nth List.set

#align list.bor List.or

#align list.band List.and

/-- List consisting of an element `a` repeated a specified number of times. -/
@[deprecated replicate, simp]
def «repeat» (a : α) (n : Nat) : List α := List.replicate n a
#align list.repeat List.repeat

#align list.last List.getLast

/-- The last element of a list, with the default if list empty -/
def getLastI [Inhabited α] : List α → α
  | [] => default
  | [a] => a
  | [_, b] => b
  | _ :: _ :: l => getLastI l
#align list.ilast List.getLastI

#align list.init List.dropLast

/-- List with a single given element. -/
@[inline] protected def ret {α : Type u} (a : α) : List α := [a]
#align list.ret List.ret

/-- `≤` implies not `>` for lists. -/
theorem le_eq_not_gt [LT α] : ∀ l₁ l₂ : List α, (l₁ ≤ l₂) = ¬l₂ < l₁ := fun _ _ => rfl
#align list.le_eq_not_gt List.le_eq_not_gt

end List
