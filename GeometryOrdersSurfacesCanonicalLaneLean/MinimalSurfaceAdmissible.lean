import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure MinimalSurfacePackage (A : AdmissibleClass) where
  ambientManifold : Type u
  topology : TopologicalSpace ambientManifold
  riemannianMetric : Type v
  surfaceSubmanifold : Type w
  meanCurvatureVanishes : Prop
  admissibleBoundary : Prop

structure MinimalSurfaceEvidence {A : AdmissibleClass} (M : MinimalSurfacePackage A) where
  meanCurvatureVanishesClosed : M.meanCurvatureVanishes
  admissibleBoundaryClosed : M.admissibleBoundary

def MinimalSurfaceClosed {A : AdmissibleClass} (M : MinimalSurfacePackage A) : Prop :=
  M.meanCurvatureVanishes ∧ M.admissibleBoundary

theorem minimal_surface_closed_from_evidence {A : AdmissibleClass} (M : MinimalSurfacePackage A)
    (E : MinimalSurfaceEvidence M) : MinimalSurfaceClosed M := by
  exact And.intro E.meanCurvatureVanishesClosed E.admissibleBoundaryClosed

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse