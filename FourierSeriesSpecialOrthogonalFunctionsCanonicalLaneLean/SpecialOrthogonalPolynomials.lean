import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure SpecialOrthogonalPolynomialsPackage (A : AdmissibleClass) where
  polynomialFamily : Type u
  recurrenceRelation : Prop
  rodriguesFormula : Prop
  orthogonalityWeight : Prop
  explicitRoots : Prop

structure SpecialOrthogonalPolynomialsEvidence {A : AdmissibleClass}
    (P : SpecialOrthogonalPolynomialsPackage A) where
  recurrenceRelationClosed : P.recurrenceRelation
  rodriguesFormulaClosed : P.rodriguesFormula
  orthogonalityWeightClosed : P.orthogonalityWeight
  explicitRootsClosed : P.explicitRoots

def SpecialOrthogonalPolynomialsClosed {A : AdmissibleClass}
    (P : SpecialOrthogonalPolynomialsPackage A) : Prop :=
  P.recurrenceRelation ∧ P.rodriguesFormula ∧ P.orthogonalityWeight ∧ P.explicitRoots

theorem special_orthogonal_polynomials_closed_from_evidence
    {A : AdmissibleClass} (P : SpecialOrthogonalPolynomialsPackage A)
    (E : SpecialOrthogonalPolynomialsEvidence P) :
    SpecialOrthogonalPolynomialsClosed P := by
  exact And.intro E.recurrenceRelationClosed
    (And.intro E.rodriguesFormulaClosed
      (And.intro E.orthogonalityWeightClosed E.explicitRootsClosed))

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse