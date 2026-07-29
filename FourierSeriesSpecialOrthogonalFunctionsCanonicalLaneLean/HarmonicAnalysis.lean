import FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean.SpecialFunctions

namespace HautevilleHouse
namespace FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean

structure SphericalHarmonicPackage where
  dimension : Nat
  laplaceBeltramiEigenfunctions : Prop
  orthonormality : Prop
  additionTheorem : Prop
  completeness : Prop

structure SphericalHarmonicEvidence (S : SphericalHarmonicPackage) where
  laplaceBeltramiEigenfunctionsClosed : S.laplaceBeltramiEigenfunctions
  orthonormalityClosed : S.orthonormality
  additionTheoremClosed : S.additionTheorem
  completenessClosed : S.completeness

def SphericalHarmonicClosed (S : SphericalHarmonicPackage) : Prop :=
  S.laplaceBeltramiEigenfunctions ∧ S.orthonormality ∧
  S.additionTheorem ∧ S.completeness

theorem spherical_harmonic_closed_from_evidence
    (S : SphericalHarmonicPackage) (E : SphericalHarmonicEvidence S) :
    SphericalHarmonicClosed S := by
  exact And.intro E.laplaceBeltramiEigenfunctionsClosed
    (And.intro E.orthonormalityClosed
      (And.intro E.additionTheoremClosed E.completenessClosed))

end FourierSeriesSpecialOrthogonalFunctionsCanonicalLaneLean
end HautevilleHouse