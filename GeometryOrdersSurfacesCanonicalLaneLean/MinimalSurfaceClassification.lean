import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure MinimalSurfacePackage where
  surface : Type u
  topology : TopologicalSpace surface
  riemannianMetric : Type v
  meanCurvature : Type w
  minimalCondition : Prop
  classification : Prop

structure MinimalSurfaceEvidence (M : MinimalSurfacePackage) where
  minimalConditionClosed : M.minimalCondition
  classificationClosed : M.classification

def MinimalSurfaceClosed (M : MinimalSurfacePackage) : Prop :=
  M.minimalCondition ∧ M.classification

theorem minimal_surface_closed_from_evidence (M : MinimalSurfacePackage)
    (E : MinimalSurfaceEvidence M) : MinimalSurfaceClosed M := by
  exact And.intro E.minimalConditionClosed E.classificationClosed

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse