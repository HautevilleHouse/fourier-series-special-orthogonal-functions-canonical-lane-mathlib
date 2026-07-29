import FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure OrthogonalPolynomialSystem where
  polynomialFamily : Type u
  weightFunction : Type v
  orthogonalityInterval : Type w
  orthogonalityRelation : Prop
  recurrenceRelation : Prop
  completeness : Prop

structure OrthogonalPolynomialEvidence (O : OrthogonalPolynomialSystem) where
  orthogonalityRelationClosed : O.orthogonalityRelation
  recurrenceRelationClosed : O.recurrenceRelation
  completenessClosed : O.completeness

def OrthogonalPolynomialClosed (O : OrthogonalPolynomialSystem) : Prop :=
  O.orthogonalityRelation ∧ O.recurrenceRelation ∧ O.completeness

theorem orthogonal_polynomial_closed_from_evidence
    (O : OrthogonalPolynomialSystem) (E : OrthogonalPolynomialEvidence O) :
    OrthogonalPolynomialClosed O := by
  exact And.intro E.orthogonalityRelationClosed
    (And.intro E.recurrenceRelationClosed E.completenessClosed)

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse