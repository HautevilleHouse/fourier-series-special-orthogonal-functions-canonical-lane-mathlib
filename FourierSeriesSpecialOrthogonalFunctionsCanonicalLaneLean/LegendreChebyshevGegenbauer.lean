import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure LegendreChebyshevGegenbauer where
  legendre : ℕ → (ℝ → ℝ)
  chebyshevFirst : ℕ → (ℝ → ℝ)
  chebyshevSecond : ℕ → (ℝ → ℝ)
  gegenbauer : ℕ → ℝ → (ℝ → ℝ)
  legendreWeight : ℝ → ℝ
  chebyshevFirstWeight : ℝ → ℝ
  chebyshevSecondWeight : ℝ → ℝ
  gegenbauerWeight : ℝ → ℝ → ℝ
  recurrenceRelation : ℕ × ℝ → Prop
  orthogonalityDomain : Set ℝ
  degrees : ℕ → Prop

structure LegendreChebyshevGegenbauerEvidence (F : LegendreChebyshevGegenbauer) where
  legendreOrthogonality : ∀ n m, n ≠ m → ∫ x in -1..1, F.legendre n x * F.legendre m x * F.legendreWeight x = 0
  chebyshevFirstOrthogonality : ∀ n m, n ≠ m → ∫ x in -1..1, F.chebyshevFirst n x * F.chebyshevFirst m x * F.chebyshevFirstWeight x = 0
  chebyshevSecondOrthogonality : ∀ n m, n ≠ m → ∫ x in -1..1, F.chebyshevSecond n x * F.chebyshevSecond m x * F.chebyshevSecondWeight x = 0
  gegenbauerOrthogonality : ∀ α, ∀ n m, n ≠ m → ∫ x in -1..1, F.gegenbauer n α x * F.gegenbauer m α x * F.gegenbauerWeight α x = 0

def LegendreChebyshevGegenbauerClosed (F : LegendreChebyshevGegenbauer) : Prop :=
  F.legendreOrthogonality ∧ F.chebyshevFirstOrthogonality ∧ F.chebyshevSecondOrthogonality ∧ F.gegenbauerOrthogonality

theorem legendre_chebyshev_gegenbauer_closed_from_evidence
    (F : LegendreChebyshevGegenbauer) (E : LegendreChebyshevGegenbauerEvidence F) :
    LegendreChebyshevGegenbauerClosed F := by
  exact And.intro E.legendreOrthogonality (And.intro E.chebyshevFirstOrthogonality (And.intro E.chebyshevSecondOrthogonality E.gegenbauerOrthogonality))

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse
