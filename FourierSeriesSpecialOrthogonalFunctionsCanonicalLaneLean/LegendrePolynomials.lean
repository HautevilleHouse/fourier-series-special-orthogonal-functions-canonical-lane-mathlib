import FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure LegendrePolynomialPackage where
  recurrenceRelation : Prop
  orthogonalityOverMinusOneToOne : Prop
  generatingFunction : Prop
  rodriguesFormula : Prop
  associatedLegendre : Prop

structure LegendrePolynomialEvidence (L : LegendrePolynomialPackage) where
  recurrenceRelationClosed : L.recurrenceRelation
  orthogonalityOverMinusOneToOneClosed : L.orthogonalityOverMinusOneToOne
  generatingFunctionClosed : L.generatingFunction
  rodriguesFormulaClosed : L.rodriguesFormula
  associatedLegendreClosed : L.associatedLegendre

def LegendrePolynomialClosed (L : LegendrePolynomialPackage) : Prop :=
  L.recurrenceRelation ∧ L.orthogonalityOverMinusOneToOne ∧
  L.generatingFunction ∧ L.rodriguesFormula ∧ L.associatedLegendre

theorem legendre_polynomial_closed_from_evidence
    (L : LegendrePolynomialPackage) (E : LegendrePolynomialEvidence L) :
    LegendrePolynomialClosed L := by
  exact And.intro E.recurrenceRelationClosed
    (And.intro E.orthogonalityOverMinusOneToOneClosed
      (And.intro E.generatingFunctionClosed
        (And.intro E.rodriguesFormulaClosed
          E.associatedLegendreClosed)))

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse