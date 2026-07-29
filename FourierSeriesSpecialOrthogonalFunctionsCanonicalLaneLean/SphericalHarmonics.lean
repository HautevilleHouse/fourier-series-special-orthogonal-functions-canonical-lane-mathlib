import FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean.LegendrePolynomials

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure SphericalHarmonicsPackage (L : LegendrePolynomialPackage) where
  laplacianEigenvalue : Prop
  orthonormalityOverSphere : Prop
  completenessOverSquareIntegrable : Prop
  additionTheorem : Prop

structure SphericalHarmonicsEvidence {L : LegendrePolynomialPackage}
    (S : SphericalHarmonicsPackage L) where
  laplacianEigenvalueClosed : S.laplacianEigenvalue
  orthonormalityOverSphereClosed : S.orthonormalityOverSphere
  completenessOverSquareIntegrableClosed : S.completenessOverSquareIntegrable
  additionTheoremClosed : S.additionTheorem

def SphericalHarmonicsClosed {L : LegendrePolynomialPackage}
    (S : SphericalHarmonicsPackage L) : Prop :=
  S.laplacianEigenvalue ∧ S.orthonormalityOverSphere ∧
  S.completenessOverSquareIntegrable ∧ S.additionTheorem

theorem spherical_harmonics_closed_from_evidence
    {L : LegendrePolynomialPackage} (S : SphericalHarmonicsPackage L)
    (E : SphericalHarmonicsEvidence S) : SphericalHarmonicsClosed S := by
  exact And.intro E.laplacianEigenvalueClosed
    (And.intro E.orthonormalityOverSphereClosed
      (And.intro E.completenessOverSquareIntegrableClosed
        E.additionTheoremClosed))

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse