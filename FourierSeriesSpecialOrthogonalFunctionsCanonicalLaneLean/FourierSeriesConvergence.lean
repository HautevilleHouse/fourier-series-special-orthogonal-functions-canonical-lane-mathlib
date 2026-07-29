import FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean.OrthogonalPolynomials

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure FourierSeriesExpansion where
  functionSpace : Type u
  orthonormalBasis : Type v
  coefficients : Type w
  partialSums : Type x
  convergenceInNorm : Prop
  pointwiseConvergence : Prop
  gibbsPhenomenon : Prop

structure FourierConvergenceEvidence (F : FourierSeriesExpansion) where
  convergenceInNormClosed : F.convergenceInNorm
  pointwiseConvergenceClosed : F.pointwiseConvergence
  gibbsPhenomenonClosed : F.gibbsPhenomenon

def FourierConvergenceClosed (F : FourierSeriesExpansion) : Prop :=
  F.convergenceInNorm ∧ F.pointwiseConvergence ∧ F.gibbsPhenomenon

theorem fourier_convergence_closed_from_evidence
    (F : FourierSeriesExpansion) (E : FourierConvergenceEvidence F) :
    FourierConvergenceClosed F := by
  exact And.intro E.convergenceInNormClosed
    (And.intro E.pointwiseConvergenceClosed E.gibbsPhenomenonClosed)

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse