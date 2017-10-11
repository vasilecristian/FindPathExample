#include "main.h"

// Declare our app instance
Sample1 app;

Sample1::Sample1()
    : m_scene(NULL), m_wireframe(false)
{
}

void Sample1::Initialize()
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

void Sample1::Finalize()
{
	m_scene = nullptr;
}

void Sample1::Update(float elapsedTime)
{
    // Rotate model
	m_scene->FindNode("box")->rotateY(MATH_DEG_TO_RAD((float)elapsedTime / 1000.0f * 180.0f));

    m_formSelect->update(elapsedTime);
}

void Sample1::Render(float elapsedTime)
{
    // Clear the color and depth buffers
    Clear(CLEAR_COLOR_DEPTH, Vector4::zero(), 1.0f, 0);

    // Visit all the nodes in the scene for drawing
	m_scene->Visit(this, &Sample1::DrawScene);

    m_formSelect->draw();
}

bool Sample1::DrawScene(std::shared_ptr<Node> node)
{
    // If the node visited contains a drawable object, draw it
    std::shared_ptr<Drawable> drawable = node->GetDrawable(); 
    if (drawable)
        drawable->draw(m_wireframe);

    return true;
}

void Sample1::KeyEvent(Keyboard::KeyEvent evt, int key)
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

void Sample1::TouchEvent(Touch::TouchEvent evt, int x, int y, unsigned int contactIndex)
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

bool Sample1::mouseEvent(teckel::Mouse::MouseEvent evt, int x, int y, int wheelDelta)
{
    return false;
}
void Sample1::resizeEvent(unsigned int width, unsigned int height)
{}
void Sample1::gestureSwipeEvent(int x, int y, int direction)
{}
void Sample1::gesturePinchEvent(int x, int y, float scale)
{}
void Sample1::gestureLongTapEvent(int x, int y, float duration)
{}
void Sample1::gestureTapEvent(int x, int y)
{}
void Sample1::gestureDragEvent(int x, int y)
{}
void Sample1::gestureDropEvent(int x, int y)
{}
