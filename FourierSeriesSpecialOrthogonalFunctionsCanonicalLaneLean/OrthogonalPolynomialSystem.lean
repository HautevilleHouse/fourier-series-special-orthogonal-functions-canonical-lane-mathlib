import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure OrthogonalPolynomialSystemPackage where
  polynomialFamily : Type
  weightFunction : Type
  innerProductSpace : Prop
  orthogonalityRelation : Prop
  threeTermRecurrence : Prop

structure OrthogonalPolynomialSystemEvidence (P : OrthogonalPolynomialSystemPackage) where
  innerProductSpaceClosed : P.innerProductSpace
  orthogonalityRelationClosed : P.orthogonalityRelation
  threeTermRecurrenceClosed : P.threeTermRecurrence

def OrthogonalPolynomialSystemClosed (P : OrthogonalPolynomialSystemPackage) : Prop :=
  P.innerProductSpace ∧ P.orthogonalityRelation ∧ P.threeTermRecurrence

theorem orthogonal_polynomial_system_closed_from_evidence
    (P : OrthogonalPolynomialSystemPackage) (E : OrthogonalPolynomialSystemEvidence P) :
    OrthogonalPolynomialSystemClosed P := by
  exact And.intro E.innerProductSpaceClosed
    (And.intro E.orthogonalityRelationClosed E.threeTermRecurrenceClosed)

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse