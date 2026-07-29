import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean.SpecialOrthogonalPolynomials

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure SphericalHarmonicsPackage {A : AdmissibleClass}
    (P : SpecialOrthogonalPolynomialsPackage A) where
  sphericalHarmonicsFamily : Type u
  laplaceEigenfunctions : Prop
  additionTheorem : Prop
  orthonormalityOnSphere : Prop

structure SphericalHarmonicsEvidence {A : AdmissibleClass}
    {P : SpecialOrthogonalPolynomialsPackage A} (S : SphericalHarmonicsPackage P) where
  laplaceEigenfunctionsClosed : S.laplaceEigenfunctions
  additionTheoremClosed : S.additionTheorem
  orthonormalityOnSphereClosed : S.orthonormalityOnSphere

def SphericalHarmonicsClosed {A : AdmissibleClass}
    {P : SpecialOrthogonalPolynomialsPackage A} (S : SphericalHarmonicsPackage P) : Prop :=
  S.laplaceEigenfunctions ∧ S.additionTheorem ∧ S.orthonormalityOnSphere

theorem spherical_harmonics_closed_from_evidence
    {A : AdmissibleClass} {P : SpecialOrthogonalPolynomialsPackage A}
    (S : SphericalHarmonicsPackage P) (E : SphericalHarmonicsEvidence S) :
    SphericalHarmonicsClosed S := by
  exact And.intro E.laplaceEigenfunctionsClosed
    (And.intro E.additionTheoremClosed E.orthonormalityOnSphereClosed)

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse