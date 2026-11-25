# Prototype

Throwaway code that answers one question the conversation cannot settle. The answer becomes a decision; the code stays on its own branch for good.

1. **Question.** State it in one sentence. The user confirms it is the right question.
2. **Branch.** Create `prototype/<name>` from the current branch. All prototype code lives only there.
3. **Build** the smallest runnable thing that answers the question, the way the project settings name (for Compose: preview composables with in-memory state, clicked through in interactive preview or a debug build). Skip tests, persistence and polish.
4. **Show the state.** Render the relevant state on screen so the user sees what each action changed.
5. **Try.** The user clicks through. Record the answer as a settled decision, naming the branch.
6. **Return.** Commit the prototype on its branch and switch back to the original branch. The prototype branch gets no merge request or pull request, ever.
