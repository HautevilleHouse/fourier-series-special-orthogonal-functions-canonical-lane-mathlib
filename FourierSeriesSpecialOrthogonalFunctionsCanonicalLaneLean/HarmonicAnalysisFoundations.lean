import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure HarmonicAnalysisFoundations where
  group : Type u
  haarMeasure : Measure group
  characters : group → (group → ℂ)
  orthogonalityCharacters : ∀ χ1 χ2, χ1 ≠ χ2 → ∫ g, χ1 g * conj (χ2 g) ∂haarMeasure = 0
  fourierTransform : (group → ℂ) → (group → ℂ)
  inversionFormula : ∀ f, f = λ x → ∫ χ, (fourierTransform f) χ * χ x ∂dualMeasure
  plancherelTheorem : ∀ f, ‖f‖² = ‖fourierTransform f‖²

structure HarmonicAnalysisFoundationsEvidence (H : HarmonicAnalysisFoundations) where
  orthogonalityCharactersClosed : H.orthogonalityCharacters
  inversionFormulaClosed : H.inversionFormula
  plancherelTheoremClosed : H.plancherelTheorem

def HarmonicAnalysisFoundationsClosed (H : HarmonicAnalysisFoundations) : Prop :=
  H.orthogonalityCharacters ∧ H.inversionFormula ∧ H.plancherelTheorem

theorem harmonic_analysis_foundations_closed_from_evidence
    (H : HarmonicAnalysisFoundations) (E : HarmonicAnalysisFoundationsEvidence H) :
    HarmonicAnalysisFoundationsClosed H := by
  exact And.intro E.orthogonalityCharactersClosed (And.intro E.inversionFormulaClosed E.plancherelTheoremClosed)

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse
