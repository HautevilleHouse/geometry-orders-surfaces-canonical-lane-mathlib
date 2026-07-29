import canonicalLaneMathlib.AdmissibleClass
import GeometryOrdersSurfacesCanonicalLaneLean.SurfaceOrder
import GeometryOrdersSurfacesCanonicalLaneLean.MinimalSurfaceAdmissible
import GeometryOrdersSurfacesCanonicalLaneLean.GaussBonnetBridge

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SurfaceOrderClosed (A.object.surfaceOrderPackage) ∧
  MinimalSurfaceClosed (A.object.minimalSurfacePackage) ∧
  GaussBonnetClosed (A.object.gaussBonnetPackage)

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  let S := A.object.surfaceOrderPackage
  let M := A.object.minimalSurfacePackage
  let G := A.object.gaussBonnetPackage
  have hS : SurfaceOrderClosed S := surface_order_closed_from_evidence S (by
    exact A.object.surfaceOrderEvidence)
  have hM : MinimalSurfaceClosed M := minimal_surface_closed_from_evidence M (by
    exact A.object.minimalSurfaceEvidence)
  have hG : GaussBonnetClosed G := gauss_bonnet_closed_from_evidence G (by
    exact A.object.gaussBonnetEvidence)
  exact And.intro hS (And.intro hM hG)

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedGeometryOrdersSurfacesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_geometry_orders_surfaces_endgame (A : AdmissibleClass) :
    ConstrainedGeometryOrdersSurfacesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse