#ifndef sample1_H_
#define sample1_H_

#include "teckel/teckel.h"

using namespace teckel;

/**
 * Main app class.
 */
class FindPathExample: public App
{
public:

    /**
     * Constructor.
     */
    FindPathExample();

    /**
     * @see App::keyEvent
     */
	void KeyEvent(Keyboard::KeyEvent evt, int key) override;
	
    /**
     * @see App::touchEvent
     */
    void TouchEvent(Touch::TouchEvent evt, int x, int y, unsigned int contactIndex) override;

    bool MouseEvent(teckel::Mouse::MouseEvent evt, int x, int y, int wheelDelta) override;
    void ResizeEvent(unsigned int width, unsigned int height) override;
    void GestureSwipeEvent(int x, int y, int direction) override;
    void GesturePinchEvent(int x, int y, float scale) override;
    void GestureLongTapEvent(int x, int y, float duration) override;
    void GestureTapEvent(int x, int y) override;
    void GestureDragEvent(int x, int y) override;
    void GestureDropEvent(int x, int y) override;

protected:

    /**
     * @see App::initialize
     */
    void Initialize() override;

    /**
     * @see App::finalize
     */
    void Finalize() override;

    /**
     * @see App::update
     */
    void Update(float elapsedTime) override;

    /**
     * @see App::render
     */
    void Render(float elapsedTime) override;

private:

    /**
     * Draws the scene each frame.
     */
    bool DrawScene(std::shared_ptr<Node> node);

    std::shared_ptr<Scene> m_scene;
    bool m_wireframe;
    std::shared_ptr<Form> m_formSelect;
};

#endif
