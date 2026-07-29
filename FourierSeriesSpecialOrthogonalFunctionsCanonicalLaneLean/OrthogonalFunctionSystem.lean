import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure OrthogonalFunctionSystem where
  domain : Type u
  measure : Measure domain
  weightFunction : domain → ℝ
  basis : ℕ → (domain → ℝ)
  orthogonalityProp : ∀ i j, i ≠ j → ∫ x, basis i x * basis j x * weightFunction x ∂measure = 0
  normSqFinite : ∀ i, ∫ x, (basis i x)^2 * weightFunction x ∂measure < ∞
  completeness : ∀ f : domain → ℝ, (∫ x, (f x)^2 * weightFunction x ∂measure < ∞) →
    (∃ (c : ℕ → ℝ), ∀ x, f x = ∑' n, c n * basis n x)

structure OrthogonalFunctionSystemEvidence (O : OrthogonalFunctionSystem) where
  orthogonalityClosed : O.orthogonalityProp
  normSqFiniteClosed : O.normSqFinite
  completenessClosed : O.completeness

def OrthogonalFunctionSystemClosed (O : OrthogonalFunctionSystem) : Prop :=
  O.orthogonalityProp ∧ O.normSqFinite ∧ O.completeness

theorem orthogonal_function_system_closed_from_evidence
    (O : OrthogonalFunctionSystem) (E : OrthogonalFunctionSystemEvidence O) :
    OrthogonalFunctionSystemClosed O := by
  exact And.intro E.orthogonalityClosed (And.intro E.normSqFiniteClosed E.completenessClosed)

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse
