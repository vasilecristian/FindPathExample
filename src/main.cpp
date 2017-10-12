#include "main.h"

// Declare our app instance
FindPathExample app;

FindPathExample::FindPathExample()
    : m_scene(NULL), m_wireframe(false)
{
}

void FindPathExample::Initialize()
{
    // Load app scene from file
    m_scene = Scene::Load("res/demo.scene");

    // Get the box model and initialize its material parameter values and bindings
	std::shared_ptr<Node> boxNode = m_scene->FindNode("box");
    std::shared_ptr<Model> boxModel = std::dynamic_pointer_cast<Model>(boxNode->GetDrawable());
    std::shared_ptr<Material> boxMaterial = boxModel->getMaterial();

    // Set the aspect ratio for the scene's camera to match the current resolution
	m_scene->GetActiveCamera()->setAspectRatio(GetAspectRatio());


    m_formSelect = Form::create("res/common/forms/formBasicControls.form");
    m_formSelect->setFocus();
   

}

void FindPathExample::Finalize()
{
	m_scene = nullptr;
}

void FindPathExample::Update(float elapsedTime)
{
    // Rotate model
	m_scene->FindNode("box")->rotateY(MATH_DEG_TO_RAD((float)elapsedTime / 1000.0f * 180.0f));

    m_formSelect->update(elapsedTime);
}

void FindPathExample::Render(float elapsedTime)
{
    // Clear the color and depth buffers
    Clear(CLEAR_COLOR_DEPTH, Vector4::zero(), 1.0f, 0);

    // Visit all the nodes in the scene for drawing
	m_scene->Visit(this, &FindPathExample::DrawScene);

    m_formSelect->draw();
}

bool FindPathExample::DrawScene(std::shared_ptr<Node> node)
{
    // If the node visited contains a drawable object, draw it
    std::shared_ptr<Drawable> drawable = node->GetDrawable(); 
    if (drawable)
        drawable->draw(m_wireframe);

    return true;
}

void FindPathExample::KeyEvent(Keyboard::KeyEvent evt, int key)
{
    if (evt == Keyboard::KEY_PRESS)
    {
        switch (key)
        {
        case Keyboard::KEY_ESCAPE:
            Exit();
            break;
        }
    }
}

void FindPathExample::TouchEvent(Touch::TouchEvent evt, int x, int y, unsigned int contactIndex)
{
    switch (evt)
    {
    case Touch::TOUCH_PRESS:
        m_wireframe = !m_wireframe;
        break;
    case Touch::TOUCH_RELEASE:
        break;
    case Touch::TOUCH_MOVE:
        break;
    };
}

bool FindPathExample::MouseEvent(teckel::Mouse::MouseEvent evt, int x, int y, int wheelDelta)
{
    return false;
}
void FindPathExample::ResizeEvent(unsigned int width, unsigned int height)
{}
void FindPathExample::GestureSwipeEvent(int x, int y, int direction)
{}
void FindPathExample::GesturePinchEvent(int x, int y, float scale)
{}
void FindPathExample::GestureLongTapEvent(int x, int y, float duration)
{}
void FindPathExample::GestureTapEvent(int x, int y)
{}
void FindPathExample::GestureDragEvent(int x, int y)
{}
void FindPathExample::GestureDropEvent(int x, int y)
{}
