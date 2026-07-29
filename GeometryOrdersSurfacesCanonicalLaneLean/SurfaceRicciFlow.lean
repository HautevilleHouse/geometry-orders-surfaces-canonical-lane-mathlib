import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure SurfaceRicciFlowPackage where
  surface : Type u
  topology : TopologicalSpace surface
  metric : Type v
  timeDomain : Type w
  ricciFlowEquation : Prop
  normalizedRicciFlow : Prop
  convergenceToConstantCurvature : Prop

structure SurfaceRicciFlowEvidence (P : SurfaceRicciFlowPackage) where
  ricciFlowEquationClosed : P.ricciFlowEquation
  normalizedRicciFlowClosed : P.normalizedRicciFlow
  convergenceToConstantCurvatureClosed : P.convergenceToConstantCurvature

def SurfaceRicciFlowClosed (P : SurfaceRicciFlowPackage) : Prop :=
  P.ricciFlowEquation ∧ P.normalizedRicciFlow ∧ P.convergenceToConstantCurvature

theorem surface_ricci_flow_closed_from_evidence (P : SurfaceRicciFlowPackage) (E : SurfaceRicciFlowEvidence P) : SurfaceRicciFlowClosed P := by
  exact And.intro E.ricciFlowEquationClosed (And.intro E.normalizedRicciFlowClosed E.convergenceToConstantCurvatureClosed)

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse