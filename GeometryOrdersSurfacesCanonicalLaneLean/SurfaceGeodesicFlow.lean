import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure SurfaceGeodesicFlowPackage where
  surface : Type u
  topology : TopologicalSpace surface
  metric : Type v
  timeDomain : Type w
  geodesicFlow : timeDomain → surface → surface
  flowComplete : Prop
  flowGeodesic : Prop
  flowEnergyReducing : Prop

structure SurfaceGeodesicFlowEvidence (P : SurfaceGeodesicFlowPackage) where
  flowCompleteClosed : P.flowComplete
  flowGeodesicClosed : P.flowGeodesic
  flowEnergyReducingClosed : P.flowEnergyReducing

def SurfaceGeodesicFlowClosed (P : SurfaceGeodesicFlowPackage) : Prop :=
  P.flowComplete ∧ P.flowGeodesic ∧ P.flowEnergyReducing

theorem surface_geodesic_flow_closed_from_evidence (P : SurfaceGeodesicFlowPackage) (E : SurfaceGeodesicFlowEvidence P) : SurfaceGeodesicFlowClosed P := by
  exact And.intro E.flowCompleteClosed (And.intro E.flowGeodesicClosed E.flowEnergyReducingClosed)

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse