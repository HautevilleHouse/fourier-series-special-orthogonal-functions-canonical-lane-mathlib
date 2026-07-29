import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure SpecialFunctionTransformPackage where
  transformType : Type
  kernelFunction : Type
  orthogonalityRelation : Prop
  inversionFormula : Prop
  parsevalIdentity : Prop

structure SpecialFunctionTransformEvidence (T : SpecialFunctionTransformPackage) where
  orthogonalityRelationClosed : T.orthogonalityRelation
  inversionFormulaClosed : T.inversionFormula
  parsevalIdentityClosed : T.parsevalIdentity

def SpecialFunctionTransformClosed (T : SpecialFunctionTransformPackage) : Prop :=
  T.orthogonalityRelation ∧ T.inversionFormula ∧ T.parsevalIdentity

theorem special_function_transform_closed_from_evidence
    (T : SpecialFunctionTransformPackage) (E : SpecialFunctionTransformEvidence T) :
    SpecialFunctionTransformClosed T := by
  exact And.intro E.orthogonalityRelationClosed
    (And.intro E.inversionFormulaClosed E.parsevalIdentityClosed)

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse