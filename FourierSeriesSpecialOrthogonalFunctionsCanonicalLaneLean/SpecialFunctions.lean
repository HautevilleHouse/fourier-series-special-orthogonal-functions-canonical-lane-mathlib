import FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean.FourierSeriesConvergence

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure LegendrePolynomialPackage where
  differentialEquation : Prop
  rodriguesFormula : Prop
  orthogonality : Prop
  generatingFunction : Prop

structure LegendrePolynomialEvidence (L : LegendrePolynomialPackage) where
  differentialEquationClosed : L.differentialEquation
  rodriguesFormulaClosed : L.rodriguesFormula
  orthogonalityClosed : L.orthogonality
  generatingFunctionClosed : L.generatingFunction

def LegendrePolynomialClosed (L : LegendrePolynomialPackage) : Prop :=
  L.differentialEquation ∧ L.rodriguesFormula ∧
  L.orthogonality ∧ L.generatingFunction

theorem legendre_polynomial_closed_from_evidence
    (L : LegendrePolynomialPackage) (E : LegendrePolynomialEvidence L) :
    LegendrePolynomialClosed L := by
  exact And.intro E.differentialEquationClosed
    (And.intro E.rodriguesFormulaClosed
      (And.intro E.orthogonalityClosed E.generatingFunctionClosed))

structure HermitePolynomialPackage where
  differentialEquation : Prop
  rodriguesFormula : Prop
  orthogonality : Prop
  generatingFunction : Prop

structure HermitePolynomialEvidence (H : HermitePolynomialPackage) where
  differentialEquationClosed : H.differentialEquation
  rodriguesFormulaClosed : H.rodriguesFormula
  orthogonalityClosed : H.orthogonality
  generatingFunctionClosed : H.generatingFunction

def HermitePolynomialClosed (H : HermitePolynomialPackage) : Prop :=
  H.differentialEquation ∧ H.rodriguesFormula ∧
  H.orthogonality ∧ H.generatingFunction

theorem hermite_polynomial_closed_from_evidence
    (H : HermitePolynomialPackage) (E : HermitePolynomialEvidence H) :
    HermitePolynomialClosed H := by
  exact And.intro E.differentialEquationClosed
    (And.intro E.rodriguesFormulaClosed
      (And.intro E.orthogonalityClosed E.generatingFunctionClosed))

structure LaguerrePolynomialPackage where
  differentialEquation : Prop
  rodriguesFormula : Prop
  orthogonality : Prop
  generatingFunction : Prop

structure LaguerrePolynomialEvidence (Lg : LaguerrePolynomialPackage) where
  differentialEquationClosed : Lg.differentialEquation
  rodriguesFormulaClosed : Lg.rodriguesFormula
  orthogonalityClosed : Lg.orthogonality
  generatingFunctionClosed : Lg.generatingFunction

def LaguerrePolynomialClosed (Lg : LaguerrePolynomialPackage) : Prop :=
  Lg.differentialEquation ∧ Lg.rodriguesFormula ∧
  Lg.orthogonality ∧ Lg.generatingFunction

theorem laguerre_polynomial_closed_from_evidence
    (Lg : LaguerrePolynomialPackage) (E : LaguerrePolynomialEvidence Lg) :
    LaguerrePolynomialClosed Lg := by
  exact And.intro E.differentialEquationClosed
    (And.intro E.rodriguesFormulaClosed
      (And.intro E.orthogonalityClosed E.generatingFunctionClosed))

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse