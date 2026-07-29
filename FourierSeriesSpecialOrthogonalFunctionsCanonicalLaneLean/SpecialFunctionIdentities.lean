import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure SpecialFunctionIdentitiesPackage where
  gammaFunction : Type u
  betaFunction : Type v
  hypergeometricSeries : Type w
  legendrePolynomials : Prop
  chebyshevPolynomials : Prop
  hermitePolynomials : Prop
  laguerrePolynomials : Prop
  besselFunctions : Prop
  recurrenceAndOrthogonality : Prop

def SpecialFunctionIdentitiesClosed (S : SpecialFunctionIdentitiesPackage) : Prop :=
  S.legendrePolynomials ∧ S.chebyshevPolynomials ∧ S.hermitePolynomials ∧
  S.laguerrePolynomials ∧ S.besselFunctions ∧ S.recurrenceAndOrthogonality

structure SpecialFunctionIdentitiesEvidence (S : SpecialFunctionIdentitiesPackage) where
  legendrePolynomialsClosed : S.legendrePolynomials
  chebyshevPolynomialsClosed : S.chebyshevPolynomials
  hermitePolynomialsClosed : S.hermitePolynomials
  laguerrePolynomialsClosed : S.laguerrePolynomials
  besselFunctionsClosed : S.besselFunctions
  recurrenceAndOrthogonalityClosed : S.recurrenceAndOrthogonality

theorem special_function_identities_closed_from_evidence (S : SpecialFunctionIdentitiesPackage)
    (E : SpecialFunctionIdentitiesEvidence S) : SpecialFunctionIdentitiesClosed S := by
  exact And.intro E.legendrePolynomialsClosed
    (And.intro E.chebyshevPolynomialsClosed
      (And.intro E.hermitePolynomialsClosed
        (And.intro E.laguerrePolynomialsClosed
          (And.intro E.besselFunctionsClosed E.recurrenceAndOrthogonalityClosed))))

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse