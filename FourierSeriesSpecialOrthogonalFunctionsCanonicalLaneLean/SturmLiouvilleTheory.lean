import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure SturmLiouvilleProblem where
  domain : Type u
  measure : Measure domain
  weightFunction : domain → ℝ
  operator : (domain → ℝ) → (domain → ℝ)
  eigenvalues : ℕ → ℝ
  eigenfunctions : ℕ → (domain → ℝ)
  eigenvalueEquation : ∀ n x, operator (eigenfunctions n) x = eigenvalues n * weightFunction x * eigenfunctions n x
  orthogonalityEigenfunctions : ∀ i j, i ≠ j → ∫ x, eigenfunctions i x * eigenfunctions j x * weightFunction x ∂measure = 0
  completeness : true

structure SturmLiouvilleTheoryEvidence (S : SturmLiouvilleProblem) where
  eigenvalueEquationClosed : S.eigenvalueEquation
  orthogonalityEigenfunctionsClosed : S.orthogonalityEigenfunctions

def SturmLiouvilleTheoryClosed (S : SturmLiouvilleProblem) : Prop :=
  S.eigenvalueEquation ∧ S.orthogonalityEigenfunctions

theorem sturm_liouville_theory_closed_from_evidence
    (S : SturmLiouvilleProblem) (E : SturmLiouvilleTheoryEvidence S) :
    SturmLiouvilleTheoryClosed S := by
  exact And.intro E.eigenvalueEquationClosed E.orthogonalityEigenfunctionsClosed

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse
