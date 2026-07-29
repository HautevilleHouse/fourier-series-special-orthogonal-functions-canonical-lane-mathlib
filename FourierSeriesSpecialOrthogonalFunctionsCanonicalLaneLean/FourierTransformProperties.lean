import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean.FourierConvergence

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure FourierTransformPropertiesPackage {A : AdmissibleClass}
    {B : OrthogonalBasisPackage A} (C : FourierConvergencePackage B) where
  inversionFormula : Prop
  convolutionProduct : Prop
  poissonSummation : Prop
  isometryPlancherel : Prop

structure FourierTransformPropertiesEvidence {A : AdmissibleClass}
    {B : OrthogonalBasisPackage A} {C : FourierConvergencePackage B}
    (T : FourierTransformPropertiesPackage C) where
  inversionFormulaClosed : T.inversionFormula
  convolutionProductClosed : T.convolutionProduct
  poissonSummationClosed : T.poissonSummation
  isometryPlancherelClosed : T.isometryPlancherel

def FourierTransformPropertiesClosed {A : AdmissibleClass}
    {B : OrthogonalBasisPackage A} {C : FourierConvergencePackage B}
    (T : FourierTransformPropertiesPackage C) : Prop :=
  T.inversionFormula ∧ T.convolutionProduct ∧ T.poissonSummation ∧ T.isometryPlancherel

theorem fourier_transform_properties_closed_from_evidence
    {A : AdmissibleClass} {B : OrthogonalBasisPackage A} {C : FourierConvergencePackage B}
    (T : FourierTransformPropertiesPackage C) (E : FourierTransformPropertiesEvidence T) :
    FourierTransformPropertiesClosed T := by
  exact And.intro E.inversionFormulaClosed
    (And.intro E.convolutionProductClosed
      (And.intro E.poissonSummationClosed E.isometryPlancherelClosed))

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse