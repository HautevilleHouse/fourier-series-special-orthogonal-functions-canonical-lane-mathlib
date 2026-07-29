import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean.OrthogonalBasisRepresentation

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure FourierConvergencePackage {A : AdmissibleClass} (B : OrthogonalBasisPackage A) where
  pointwiseConvergence : Prop
  uniformConvergence : Prop
  convergenceInL2 : Prop
  gibbsPhenomenonBound : Prop

structure FourierConvergenceEvidence {A : AdmissibleClass} {B : OrthogonalBasisPackage A}
    (C : FourierConvergencePackage B) where
  pointwiseConvergenceClosed : C.pointwiseConvergence
  uniformConvergenceClosed : C.uniformConvergence
  convergenceInL2Closed : C.convergenceInL2
  gibbsPhenomenonBoundClosed : C.gibbsPhenomenonBound

def FourierConvergenceClosed {A : AdmissibleClass} {B : OrthogonalBasisPackage A}
    (C : FourierConvergencePackage B) : Prop :=
  C.pointwiseConvergence ∧ C.uniformConvergence ∧ C.convergenceInL2 ∧ C.gibbsPhenomenonBound

theorem fourier_convergence_closed_from_evidence {A : AdmissibleClass} {B : OrthogonalBasisPackage A}
    (C : FourierConvergencePackage B) (E : FourierConvergenceEvidence C) :
    FourierConvergenceClosed C := by
  exact And.intro E.pointwiseConvergenceClosed
    (And.intro E.uniformConvergenceClosed
      (And.intro E.convergenceInL2Closed E.gibbsPhenomenonBoundClosed))

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse